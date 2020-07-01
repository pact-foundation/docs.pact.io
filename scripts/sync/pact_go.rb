#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-go'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/go')
COMMENT = edit_comment_for(SOURCE_REPO)

INCLUDE = [
  ->(path) { %w{README.md CHANGELOG.md TROUBLESHOOTING.md}.include?(path) }
]
IGNORE = []

CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.clean_up_changelog
  }]
]

TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase) }

FileUtils.mkdir_p DESTINATION_DIR

each_file(get_file_list(SOURCE_REPO, INCLUDE)) do | path, content |
  process_file(path, content, TRANSFORM_PATH, CUSTOM_ACTIONS, COMMENT)
end
