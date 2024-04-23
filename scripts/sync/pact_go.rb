#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-go'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/go')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase) }
INCLUDE = [
  ->(path) { %w{README.md}.include?(path) },
  ->(path) { %w{CHANGELOG.md MIGRATION.md}.include?(path) },
  ->(path) { path.start_with?('docs') && path.end_with?('md') }
]
IGNORE = []
CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README"; md_file_contents.fields[:slug] = "./readme" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.clean_up_changelog
  }]
]


FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)