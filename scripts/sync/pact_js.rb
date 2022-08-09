#!/usr/bin/env ruby

require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-js'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/javascript')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase) }
INCLUDE = [
  # ->(path) { path.end_with?('.md') }
  ->(path) { %w{ROADMAP.md CHANGELOG.md README.md CONTRIBUTING.md}.include?(path) },
  ->(path) { path.start_with?('docs') && path.end_with?('md') }
]
IGNORE = []

CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Overview"; md_file_contents.fields[:slug] = "./readme" } ]
]


FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)