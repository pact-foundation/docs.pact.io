#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-python'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/python')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase.gsub('/readme.md', '/index.md')) } # Rename README.md to index.md, but not the top level README
INCLUDE = [
  ->(path) { %w{README.md CHANGELOG.md}.include?(path) }
]
IGNORE = [
  ->(path) { path.start_with?('.github/') }
]
CUSTOM_ACTIONS = [
  [->(path) { path != 'CHANGELOG.md'}, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README"; md_file_contents.fields[:slug] = "./readme" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.fields[:title] = "Changelog"
  }]
]


sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)
