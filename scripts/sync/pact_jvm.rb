#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'DiUS/pact-jvm'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/jvm')
TRANSFORM_PATH = -> (path) {
  # Rename README.md file, but not the top level README
  File.join(DESTINATION_DIR, path.downcase.gsub('/readme.md', '.md'))
}
INCLUDE = [
  ->(path) { path.end_with?('.md') }
]
IGNORE = [
  ->(path) { path.include?('tests_suits') },
  ->(path) { path.start_with?('core/', '.github/', 'pact-publish/', 'pact-specification-test/', 'provider/scalasupport/', 'ReleaseProcess.md') }
]
CUSTOM_ACTIONS = [
  [->(path) { path != 'CHANGELOG.md'}, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.fields[:title] = "Changelog"
    md_file_contents.remove_lines_including('To generate the log')
    md_file_contents.remove_lines_including('- chore: ')
    md_file_contents.remove_lines_including('- docs: ')
    md_file_contents.remove_lines_including('- doc: ')
    md_file_contents.remove_lines_including('- refactor: ')
    md_file_contents.remove_lines_including('- style: ')
    md_file_contents.find_and_replace(/^# /, '## ')
  }]
]

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)