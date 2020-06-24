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
COMMENT = "<!-- This file has been synced from the #{SOURCE_REPO} repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->"

CUSTOM_ACTIONS = [
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ]
]

TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase) }

FileUtils.mkdir_p DESTINATION_DIR

each_file(get_file_list(SOURCE_REPO, INCLUDE)) do | path, content |
  process_file(path, content, TRANSFORM_PATH, CUSTOM_ACTIONS, COMMENT)
end
