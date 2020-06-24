#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'
require_relative 'support'

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
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.lines.unshift("# #{md_file_contents.fields[:title]}")
    md_file_contents.lines.unshift("")
    md_file_contents.fields[:title] = "Changelog"
    instructions_index = md_file_contents.lines.find_index { |line| line.include?('To generate the log') }
    md_file_contents.lines.delete_at(instructions_index) if instructions_index
  }]
]

TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase.gsub('/readme.md', '/index.md')) } # Rename README.md to index.md, but not the top level README

each_file(get_file_list(SOURCE_REPO, INCLUDE, IGNORE)) do | path, content |
  process_file(path, content, TRANSFORM_PATH, CUSTOM_ACTIONS, COMMENT)
end
