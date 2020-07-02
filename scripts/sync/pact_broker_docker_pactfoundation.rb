#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-broker-docker'
DESTINATION_DIR = relative_path_to('docs/pact_broker/docker_images')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase).gsub('/readme.md', '/pactfoundation.md') }
COMMENT = edit_comment_for(SOURCE_REPO)
INCLUDE = [
  ->(path) { %w{README.md}.include?(path) }
]
IGNORE = []
CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "pactfoundation/pact-broker" } ]
]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)