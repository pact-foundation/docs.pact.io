#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-stub-server'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/rust')
TRANSFORM_PATH = -> (path) {
  if path.downcase.end_with?('changelog.md')
    File.join(DESTINATION_DIR, "pact-stub-server", 'changelog.md')
  else
    File.join(DESTINATION_DIR, 'pact-stub-server.md')
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
    md_file_contents.fields[:title] = "pact-stub-server"
    md_file_contents.clean_up_changelog
    md_file_contents.find_and_replace(/^# /, '## ')
    # md_file_contents.find_and_replace(%r{</details>}, '&lt;/details&gt;')
  }],
]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)
