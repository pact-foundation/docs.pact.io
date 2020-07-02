#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-cplusplus'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/cpp')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase.gsub('/readme.md', '/index.md')) } # Rename README.md to index.md, but not the top level README
INCLUDE = [
  ->(path) { path.end_with?('.md') && !path.start_with?('consumer/docs/') }
]
IGNORE = []
CUSTOM_ACTIONS = [
  [->(path) { path != 'consumer/CHANGELOG.md'}, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ],
  ["consumer/CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.fields[:title] = "Consumer DSL Changelog"
    md_file_contents.remove_lines_including('- chore: ')
    md_file_contents.remove_lines_including('- docs: ')
    md_file_contents.remove_lines_including('- doc: ')
    md_file_contents.remove_lines_including('- refactor: ')
    md_file_contents.remove_lines_including('- style: ')
  }]
]


FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)
