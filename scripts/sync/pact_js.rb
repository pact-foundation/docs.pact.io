#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'

PROJECT_ROOT = File.expand_path(File.join(__FILE__, '..', '..', '..'))
SYNCED_CONTENT_DIR = File.join(PROJECT_ROOT, 'docs', 'implementation_guides', 'javascript')

FileUtils.mkdir_p SYNCED_CONTENT_DIR

def add_header path
  lines = File.readlines(path)
  heading_index = lines.find_index { | line | line.start_with?('#') }
  if heading_index
    title = lines.delete_at(heading_index).gsub(/^#+/, '').strip
    if lines.first.start_with?('---')
      lines.insert(1, "title: #{title}\n")
    else
      lines = ["---\n", "title: #{title}\n", "---\n"] + lines
    end

    if ENV['DRY_RUN'] == 'true'
      # puts lines.join
      puts "Good: #{path}"
    else
      File.open(path, "w") { |file| file << lines.join }
    end
  else
    puts "Could not find a heading for page #{path}"
  end
end

def add_please_do_not_edit_directly_comment(path)
  lines = File.readlines(path)
  close_header_index = find_close_header_index(lines)
  lines.insert(close_header_index + 1, "<!-- This file has been synced from the pact-js repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->\n")
  File.open(path, "w") { |file| file << lines.join }
end

def find_close_header_index(lines)
  open_header_found = false
  close_header_index = nil

  lines.size.times do | i |
    line = lines[i]
    if line.start_with?('---')
      if open_header_found
        close_header_index = i
        break
      else
        open_header_found = true
      end
    end
  end
  close_header_index
end

def add_fields path, fields
  lines = File.readlines(path)
  close_header_index = find_close_header_index(lines)

  fields.each do | key, value |
    lines.insert(close_header_index, "#{key}: #{value}\n")
  end
  File.open(path, "w") { |file| file << lines.join }
end

def override_title path, title
  lines = File.readlines(path)
  title_index = lines.find_index { | line | line.start_with?('title:') }
  lines[title_index] = "title: #{title}\n"
  File.open(path, "w") { |file| file << lines.join }
end

def sync(destination, content)
  puts "Writing file #{destination}"
  FileUtils.mkdir_p(File.dirname(destination))
  File.open(destination, "w") { |file| file << content }
end

def each_file(files)
  files.each do | file |
    file_resource = file.rels[:self].get
    yield file.path, Base64.decode64(file_resource.data.content)
  end
end

client = Octokit::Client.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
client.auto_paginate = true
tree = client.tree('pact-foundation/pact-js', 'master',  recursive: true).tree
markdown_files = tree.select do | file |
  file.path.end_with?('.md') &&
    !file.path.start_with?('.github/') &&
    !file.path.start_with?('examples/')
end

each_file(markdown_files) do | path, content |
  new_name = path.gsub(/\.markdown$/,  '.md').downcase
  destination = File.join(SYNCED_CONTENT_DIR, new_name)
  sync(destination, content)
  add_header(destination)
  add_fields(destination, { custom_edit_url: "https://github.com/pact-foundation/pact-js/edit/master/#{path}" })
  add_please_do_not_edit_directly_comment(destination)
end

override_title "docs/implementation_guides/javascript/readme.md", "README"
