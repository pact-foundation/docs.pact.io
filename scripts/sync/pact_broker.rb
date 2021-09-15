#!/usr/bin/env ruby

require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact_broker'
DESTINATION_DIR = relative_path_to('docs/pact_broker')
TRANSFORM_PATH = -> (path) {
  if path.end_with?("CONFIGURATION.md")
    DESTINATION_DIR / "configuration" / "settings.md"
  else
    File.join(DESTINATION_DIR, path.downcase)
  end
}
INCLUDE = [
  ->(path) { %w{CHANGELOG.md docs/CONFIGURATION.md}.include?(path) }
]
IGNORE = []

CUSTOM_ACTIONS = [
  [->(path) { path != 'CHANGELOG.md'}, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ],
  ["docs/CONFIGURATION.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Settings" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.fields[:title] = "Changelog"
    md_file_contents.find_and_replace(/^###\s/, "\n### ")
  }]
]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)
