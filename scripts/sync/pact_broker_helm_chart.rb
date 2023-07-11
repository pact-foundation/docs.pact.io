#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-broker-chart'
DESTINATION_DIR = relative_path_to('docs/pact_broker/kubernetes')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase).gsub('/charts/pact-broker/readme.md', '/readme.md') }
INCLUDE = [
  ->(path) { %w{charts/pact-broker/README.md}.include?(path) }
]
IGNORE = []
CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["charts/pact-broker/README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Deploy with Helm"; md_file_contents.fields[:slug] = "./readme" } ]
]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)
