#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-core-mock-server'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/rust')
CLI_DESTINATION_DIR = relative_path_to('docs/implementation_guides/cli')
TRANSFORM_PATH = -> (path) {
  if path == 'rust/README.md'
    "#{DESTINATION_DIR}.md"
  elsif path == "pact_mock_server_cli/README.md"
    "#{CLI_DESTINATION_DIR}/pact-mock-server.md"
  elsif path == "pact_mock_server_cli/CHANGELOG.md"
    "#{CLI_DESTINATION_DIR}/pact-mock-server/changelog.md"
  else
    File.join(DESTINATION_DIR, path.downcase.delete_prefix('rust/').gsub('/readme.md', '.md'))
  end
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
  ["pact_mock_server_cli/README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Pact Mock Server" } ],
  [:all, ->(md_file_contents) { md_file_contents.escape_things_that_look_like_jsx_tags }],
  [->(path) { path.include?('cli') }, lambda { |md_file_contents|
                                          md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/main/pact_mock_server_cli\n")
                                        }],
  [->(path) { path.include?('pact_mock_server/README.md') }, lambda { |md_file_contents| md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/main/pact_mock_server\n") }],
  [->(path) { path.include?('pact_mock_server/CHANGELOG.md') }, lambda { |md_file_contents| md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/main/pact_mock_server\n") }],
]


FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS, 'main')
