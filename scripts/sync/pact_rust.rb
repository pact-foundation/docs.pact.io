#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-reference'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/rust')
COMMENT = edit_comment_for(SOURCE_REPO)
INCLUDE = [
  ->(path) { path.start_with?('rust') && path.end_with?('.md') }
]

CUSTOM_ACTIONS = [
  [->(path) { !path.end_with?('CHANGELOG.md') }, ->(md_file_contents) { md_file_contents.extract_title } ],
  [->(path) { path.end_with?('CHANGELOG.md') }, ->(md_file_contents) {
    md_file_contents.fields[:title] = md_file_contents.fields[:custom_edit_url].split('/')[-2]
    md_file_contents.remove_lines_including('To generate the log')
    md_file_contents.remove_lines_including('- chore: ')
    md_file_contents.remove_lines_including('- docs: ')
    md_file_contents.remove_lines_including('- doc: ')
    md_file_contents.remove_lines_including('- refactor: ')
    md_file_contents.remove_lines_including('- style: ')
    md_file_contents.find_and_replace(/^# /, '## ')
  }],
  ["rust/README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Overview" } ],
]

TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase.delete_prefix('rust').gsub('/readme.md', '/index.md')) }

FileUtils.mkdir_p DESTINATION_DIR

each_file(get_file_list(SOURCE_REPO, INCLUDE)) do | path, content |
  process_file(path, content, TRANSFORM_PATH, CUSTOM_ACTIONS, COMMENT)
end
