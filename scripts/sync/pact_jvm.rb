#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'

SOURCE_REPO = 'dius/pact-jvm'
PROJECT_ROOT = File.expand_path(File.join(__FILE__, '..', '..', '..'))
DESTINATION_DIR = Pathname.new(File.join(PROJECT_ROOT, 'docs', 'implementation_guides', 'jvm')).relative_path_from(Pathname.pwd)
INCLUDE = [
  ->(path) { path.end_with?('.md') }
]
IGNORE = [
  ->(path) { path.include?('tests_suits') },
  ->(path) { path.start_with?('core/', '.github/', 'pact-publish/', 'pact-specification-test/', 'provider/scalasupport/', 'provider/scalatest/', 'provider/specs2/', 'ReleaseProcess.md') }
]
COMMENT = "<!-- This file has been synced from the #{SOURCE_REPO} repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->"

CUSTOM_ACTIONS = [
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ]
]

class MarkdownFileContents
  attr_reader :lines, :fields, :comments

  def initialize(lines, fields = {}, comments = [])
    @lines = lines
    @fields = fields
    @comments = comments
  end

  def extract_title
    heading_underline_index = lines.find_index{ |line| line.start_with?("======") }

    if heading_underline_index && heading_underline_index > 0
      lines.delete_at(heading_underline_index)
      title = lines.delete_at(heading_underline_index - 1).strip
      self.fields[:title] = title
    else
      heading_index = lines.find_index { | line | line.start_with?('#') }
      if heading_index
        title = lines.delete_at(heading_index).gsub(/^#+/, '').strip
        self.fields[:title] = title
      else
        raise "Could not find a heading for page with head lines #{lines[0..5].join}"
      end
    end
  end

  def to_s
    ["---", header_lines, "---", comments, lines].flatten.join("\n") + "\n"
  end

  private

  def header_lines
    [:title, :custom_edit_url, :description].collect do | key |
      if fields[key]
        "#{key}: #{fields[key]}"
      end
    end.compact
  end
end

def get_file_list
  client = Octokit::Client.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
  client.auto_paginate = true
  tree = client.tree(SOURCE_REPO, 'master',  recursive: true).tree
  markdown_files = tree.select do | file |
    INCLUDE.any?{ |lambda| lambda.call(file.path) } && !IGNORE.any? { |lambda| lambda.call(file.path) }
  end
end

def each_file(files)
  files.each do | file |
    file_resource = file.rels[:self].get
    yield file.path, Base64.decode64(file_resource.data.content)
  end
end

def process_file(path, content)
  new_path = path.gsub(/\.markdown$/,  '.md').downcase
  destination = File.join(DESTINATION_DIR, new_path)
  fields = { custom_edit_url: "https://github.com/#{SOURCE_REPO}/edit/master/#{path}" }
  md_file_contents = MarkdownFileContents.new(content.split("\n"), fields, [COMMENT])
  md_file_contents.extract_title

  CUSTOM_ACTIONS.select{ | source_path , _ | source_path == path }.collect(&:last).each { |action| action.call(md_file_contents) }

  puts "Writing file #{destination}"
  File.open(destination, "w") { |file| file << md_file_contents.to_s }
end

FileUtils.mkdir_p DESTINATION_DIR

each_file(get_file_list) do | path, content |
  process_file(path, content)
end
