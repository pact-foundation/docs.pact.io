#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-core-mock-server'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/rust')
TRANSFORM_PATH = -> (path) {
  File.join(DESTINATION_DIR, path.downcase.delete_prefix('rust/').gsub('/readme.md', '.md'))
}
INCLUDE = [
  ->(path) { path.start_with?('pact_mock_server_cli') && path.end_with?('.md') },
  ->(path) { path.start_with?('pact_mock_server') && path.end_with?('.md') }
]
IGNORE = []
CUSTOM_ACTIONS = [
  [->(path) { !path.end_with?('CHANGELOG.md') }, ->(md_file_contents) { md_file_contents.extract_title } ],
  [->(path) { path.end_with?('CHANGELOG.md') }, ->(md_file_contents) {
    md_file_contents.fields[:title] = md_file_contents.fields[:custom_edit_url].split('/')[-2]
    md_file_contents.clean_up_changelog
    md_file_contents.find_and_replace(/^# /, '## ')
    md_file_contents.find_and_replace(%r{</details>}, '&lt;/details&gt;')
  }],
  ["rust/README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Overview" } ],
  [:all, ->(md_file_contents) { md_file_contents.escape_things_that_look_like_jsx_tags }]
]


FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS, 'main')
