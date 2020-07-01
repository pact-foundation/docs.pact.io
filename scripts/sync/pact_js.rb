#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-js'
PROJECT_ROOT = File.expand_path(File.join(__FILE__, '..', '..', '..'))
DESTINATION_DIR = Pathname.new(File.join(PROJECT_ROOT, 'docs', 'implementation_guides', 'javascript')).relative_path_from(Pathname.pwd)
INCLUDE = [
  ->(path) { %w{ROADMAP.md CHANGELOG.md README.md CONTRIBUTING.md}.include?(path) }
]
IGNORE = []
COMMENT = edit_comment_for(SOURCE_REPO)

CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ]
]

TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase) }

FileUtils.mkdir_p DESTINATION_DIR

each_file(get_file_list(SOURCE_REPO, INCLUDE)) do | path, content |
  process_file(path, content, TRANSFORM_PATH, CUSTOM_ACTIONS, COMMENT)
end
