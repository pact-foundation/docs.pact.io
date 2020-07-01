#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-broker-docker'
DESTINATION_DIR = relative_path_to('docs/pact_broker/docker_images')
COMMENT = edit_comment_for(SOURCE_REPO)
INCLUDE = [
  ->(path) { %w{README.md}.include?(path) }
]

CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "pactfoundation/pact-broker" } ]
]

TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase).gsub('/readme.md', '/pactfoundation.md') }

FileUtils.mkdir_p DESTINATION_DIR

each_file(get_file_list(SOURCE_REPO, INCLUDE)) do | path, content |
  process_file(path, content, TRANSFORM_PATH, CUSTOM_ACTIONS, COMMENT)
end
