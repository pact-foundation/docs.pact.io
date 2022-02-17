#!/usr/bin/env ruby

require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact_broker-client'
DESTINATION_DIR = relative_path_to('docs/pact_broker/client_cli')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase.gsub("doc/", "/")) }
INCLUDE = [
  ->(path) { %w{CHANGELOG.md README.md doc/CAN_I_DEPLOY_USAGE_WITH_TAGS.md}.include?(path) }
]
IGNORE = []

CUSTOM_ACTIONS = [
  [->(path) { path != 'CHANGELOG.md'}, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) {
    md_file_contents.fields[:title] = "README"
    md_file_contents.fields[:slug] = "./readme"
    }
  ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.fields[:title] = "Changelog"
  }]
]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)
