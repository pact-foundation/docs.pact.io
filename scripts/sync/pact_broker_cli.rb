#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-broker-cli'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/rust')
TRANSFORM_PATH = -> (path) {
  if path.downcase.end_with?('changelog.md')
    File.join(DESTINATION_DIR, "pact-broker-cli", 'changelog.md')
  else
    File.join(DESTINATION_DIR, 'pact-broker-cli.md')
  end
}
INCLUDE = [
  ->(path) { path.end_with?('.md') },
]
IGNORE = [
  ->(path) { path.include?('docker') }
]
CUSTOM_ACTIONS = [
  [->(path) { !path.end_with?('CHANGELOG.md') }, ->(md_file_contents) { md_file_contents.extract_title } ],
  [->(path) { path.end_with?('CHANGELOG.md') }, ->(md_file_contents) {
    md_file_contents.fields[:title] = 'pact-broker-cli'
    md_file_contents.find_and_replace(/^# /, '## ')
  }],
  [->(path) { path.end_with?('README.md') }, ->(md_file_contents) {
    md_file_contents.fields[:title] = 'Pact Broker Client'
  }],
]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS, 'main')
