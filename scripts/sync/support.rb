require 'addressable'
require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'

module UrlAbsolutizer
  extend self

  def absolutize_links(contents, source_repository_slug, link_transformer, contents_source_path, synced_source_paths, branch)
    contents.gsub(/\]\(([^)]+)\)/) { | match |
      url = match[2..-2]

      if url.start_with?('http', '#')
        match
      else
        url_without_anchor, anchor = url.split('#', 2)
        optional_anchor = anchor ? "##{anchor}" : ""
        # the path of the file in the docs.pact.io site
        path_from_root = if url.start_with?('.')
          Addressable::URI.parse(File.join(File.dirname(contents_source_path), url_without_anchor)).normalize.to_s.chomp('/')
        else
          url_without_anchor.delete_prefix('/')
        end

        transformed_link = link_transformer.call(path_from_root) + optional_anchor

        if synced_source_paths.include?(path_from_root)
          "](#{transformed_link})"
        elsif synced_source_paths.include?(File.join(path_from_root, 'README.md'))
          "](#{transformed_link})"
        else
          # if url is an image, add ?raw=true to the absolute_url
          if url.end_with?('.png', '.jpg', '.jpeg', '.gif')
            absolute_url = (Addressable::URI.parse("https://github.com/#{source_repository_slug}/blob/#{branch}/") + path_from_root).to_s + optional_anchor + "?raw=true"
            "](#{absolute_url})"
          else
            absolute_url = (Addressable::URI.parse("https://github.com/#{source_repository_slug}/blob/#{branch}/") + path_from_root).to_s + optional_anchor
            "](#{absolute_url})"
          end
        end
      end
    }
  end
end

class MarkdownFileContents
  attr_accessor :lines, :fields, :comments

  def initialize(lines, fields = {}, comments = [])
    @lines = lines
    @fields = fields
    @comments = comments
  end

  def extract_title
    heading_underline_index = lines.find_index{ |line| line.start_with?("======") } || -1
    heading_index = lines.find_index { | line | line.start_with?('#') } || -1

    if heading_underline_index != -1 && heading_underline_index < heading_index
      lines.delete_at(heading_underline_index)
      title = lines.delete_at(heading_underline_index - 1).strip
      self.fields[:title] = title
    else
      if heading_index != -1
        title = lines.delete_at(heading_index).gsub(/^#+/, '').strip
        self.fields[:title] = title
      else
        raise "Could not find a heading for page with head lines #{lines[0..5].join}"
      end
    end
  end

  def to_s
    comments_maybe_newlines = comments.dup
    if lines.first && lines.first.strip != ''
      comments_maybe_newlines << ""
    end
    ["---", header_lines, "---", comments_maybe_newlines, lines].flatten.join("\n") + "\n"
  end

  def find_and_replace(find, replace)
    @lines = lines.collect{ |line| line.gsub(find, replace) }
  end

  def find_and_replace_underlined_headings
    @lines.each_with_index do |line, index|
      if line.strip.start_with?('====')
        @lines[index - 1] = "# #{@lines[index - 1].strip}"
        @lines.delete_at(index)
      elsif line.strip.start_with?('------')
        @lines[index - 1] = "## #{@lines[index - 1].strip}"
        @lines.delete_at(index)
      end
    end
  end

  def remove_lines_including(substring)
    @lines = lines.select{ |line| !line.include?(substring) }
  end

  def add_lines_at_start(*new_lines)
    @lines = new_lines + lines
  end

  def clean_up_changelog
    @lines = lines.collect do | line |
      if line.start_with?('#')
        line
      elsif line.strip.size.zero?
        line
      elsif line.include?('feat:') || line.include?('fix:') || line.include?('Merge pull request')
        line
      end
    end.compact
  end

  def absolutize_links(repository_slug, link_transformer, contents_source_path, source_paths, branch)
    @lines = lines.collect do |line|
      UrlAbsolutizer.absolutize_links(line, repository_slug, link_transformer, contents_source_path, source_paths,
                                      branch)
    end
  end

  def escape_things_that_look_like_jsx_tags
    in_code_block = false
    @lines = lines.collect do | line |
      in_code_block = !in_code_block if line.start_with?('```')

      if !in_code_block
        if line =~ /<[A-Za-z0-9\-_\s]+>/
          in_backticks = false
          line.chars.collect do | char |
            # Doesn't handle escaped backticks within backticks
            in_backticks = !in_backticks if char == '`'

            if !in_backticks
              case char
              when '<' then '&lt;'
              when '>' then '&gt;'
              else char
              end
            else
              char
            end
          end.join
        else
          line
        end
      else
        line
      end
    end
  end

  private

  def header_lines
    [:title, :custom_edit_url, :slug, :description].collect do | key |
      if fields[key]
        "#{key}: #{fields[key]}"
      end
    end.compact
  end
end

PROJECT_ROOT = File.expand_path(File.join(__FILE__, '..', '..', '..'))

def relative_path_to path
  Pathname.new(File.join(PROJECT_ROOT, 'website', path)).relative_path_from(Pathname.pwd)
end

def edit_comment_for slug
  "<!-- This file has been synced from the #{slug} repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->"
end

def get_file_list(repository_slug, include_conditions = [], exclude_conditions = [], branch)
  client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
  client.auto_paginate = true
  tree = client.tree(repository_slug, branch, recursive: true).tree
  if include_conditions.any? || exclude_conditions.any?
    filter_file_list(tree, include_conditions, exclude_conditions)
  else
    tree
  end
end

def filter_file_list(file_list, include_conditions, exclude_conditions = [])
  file_list.select do | file |
    include_conditions.any?{ |lambda| lambda.call(file.path) } && !exclude_conditions.any? { |lambda| lambda.call(file.path) }
  end
end

def each_file(files)
  files.each do | file |
    file_resource = file.rels[:self].get
    yield file.path, Base64.decode64(file_resource.data.content)
  end
end

def select_actions(custom_actions, path)
  custom_actions
    .select{ | selector , _ | selector == :all || selector == path || (selector.respond_to?(:call) && selector.call(path))  }
    .collect(&:last)
end

def process_file(path, content, path_transformer, custom_actions, comment, source_file_paths, source_repository_slug, branch = 'master')
  destination = path_transformer.call(path)
  fields = { custom_edit_url: "https://github.com/#{source_repository_slug}/edit/#{branch}/#{path}" }
  md_file_contents = MarkdownFileContents.new(content.split("\n"), fields, [comment])
  select_actions(custom_actions, path).each { |action| action.call(md_file_contents) }
  if source_file_paths && source_repository_slug
    link_transformer = -> (path){
      path_transformer.call(path).delete_prefix('website/docs').chomp('.md')
    }
    md_file_contents.absolutize_links(source_repository_slug, link_transformer, path, source_file_paths, branch)
  end

  puts "Writing file #{destination}"
  FileUtils.mkdir_p(File.dirname(destination))
  File.open(destination, "w") { |file| file << md_file_contents.to_s }
  md_file_contents
end

def sync(source_repository_slug, include_filter, ignore_filter, path_transformer, actions, branch = 'master')
  file_list = get_file_list(source_repository_slug, include_filter, ignore_filter, branch)
  processed_files = each_file(file_list) do |path, content|
    process_file(path, content, path_transformer, actions, edit_comment_for(source_repository_slug),
                 file_list.collect(&:path), source_repository_slug, branch)
  end
end
