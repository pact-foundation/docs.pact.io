#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-reference'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/rust')
CLI_DESTINATION_DIR = relative_path_to('docs/implementation_guides/cli')
TRANSFORM_PATH = -> (path) {
  if path == 'rust/README.md'
    "#{DESTINATION_DIR}.md"
  elsif path == "rust/pact_verifier_cli/README.md"
    "#{CLI_DESTINATION_DIR}/pact-verifier.md"
  elsif path == "rust/pact_verifier_cli/CHANGELOG.md"
    "#{CLI_DESTINATION_DIR}/pact-verifier/changelog.md"
  else
    File.join(DESTINATION_DIR, path.downcase.delete_prefix('rust/').gsub('/readme.md', '.md'))
  end
}
INCLUDE = [
  ->(path) { path.start_with?('rust') && path.end_with?('.md') }
]
IGNORE = [
->(path) { path == 'rust/pact_mock_server/README.md' },
->(path) { path == 'rust/pact_mock_server/CHANGELOG.md' },
->(path) { path == 'rust/pact_mock_server_cli/README.md' },
->(path) { path == 'rust/pact_mock_server_cli/CHANGELOG.md' }
]
CUSTOM_ACTIONS = [
  [->(path) { !path.end_with?('CHANGELOG.md') }, ->(md_file_contents) { md_file_contents.extract_title } ],
  [->(path) { path.end_with?('CHANGELOG.md') }, ->(md_file_contents) {
    md_file_contents.fields[:title] = md_file_contents.fields[:custom_edit_url].split('/')[-2]
    md_file_contents.clean_up_changelog
    md_file_contents.find_and_replace(/^# /, '## ')
  }],
  ["rust/README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Overview" } ],
  ["rust/pact_ffi/README.md", ->(md_file_contents) { 
    md_file_contents.find_and_replace(%r{</details>}, '&lt;/details&gt;')
    md_file_contents.fields[:title] = "README"
   }],
  ["rust/pact_verifier_cli/README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Pact Verifier" } ],
  [->(path) { path.include?('cli') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/master/rust/pact_verifier_cli\n")
                                          }],
  [->(path) { path.include?('rust/pact_verifier/') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/master/rust/pact_verifier\n")
                                          }],
  [->(path) { path.include?('rust/pact_consumer/') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/master/rust/pact_consumer\n")
                                          }],
  [->(path) { path.include?('rust/pact_models/') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/master/rust/pact_models\n")
                                          }],
  [->(path) { path.include?('rust/pact_matching/') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/master/rust/pact_matching\n")
                                          }],
  [->(path) { path.include?('rust/pact_ffi/') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/master/rust/pact_ffi\n")
                                          }],
  [->(path) { path.include?('rust/readme.md') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/master/rust\n")
                                          }],
  [:all, ->(md_file_contents) { md_file_contents.escape_things_that_look_like_jsx_tags }]
]


FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)
