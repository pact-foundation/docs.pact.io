#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'
require_relative 'support'

SOURCE_REPO = 'dius/pact-jvm'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/jvm')
COMMENT = edit_comment_for(SOURCE_REPO)
INCLUDE = [
  ->(path) { path.end_with?('.md') }
]
IGNORE = [
  ->(path) { path.include?('tests_suits') },
  ->(path) { path.start_with?('core/', '.github/', 'pact-publish/', 'pact-specification-test/', 'provider/scalasupport/', 'ReleaseProcess.md') }
]

CUSTOM_ACTIONS = [
  [->(path) { path != 'CHANGELOG.md'}, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.fields[:title] = "Changelog"
    md_file_contents.remove_lines_including('To generate the log')
    md_file_contents.remove_lines_including('- chore: ')
    md_file_contents.remove_lines_including('- docs: ')
    md_file_contents.remove_lines_including('- doc: ')
    md_file_contents.remove_lines_including('- refactor: ')
    md_file_contents.remove_lines_including('- style: ')
    md_file_contents.find_and_replace(/^# /, '## ')
  }]
]

TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase.gsub('/readme.md', '/index.md')) } # Rename README.md to index.md, but not the top level README

each_file(get_file_list(SOURCE_REPO, INCLUDE, IGNORE)) do | path, content |
  process_file(path, content, TRANSFORM_PATH, CUSTOM_ACTIONS, COMMENT)
end
