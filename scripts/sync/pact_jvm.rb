#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-jvm'
DESTINATION_DIR_V4_6_X = relative_path_to('docs/implementation_guides/jvm')
DESTINATION_DIR_V4_5_X = relative_path_to('docs/implementation_guides/jvm/v4.5.x')
DESTINATION_DIR_V4_1_X = relative_path_to('docs/implementation_guides/jvm/v4.1.x')
TRANSFORM_PATH_V4_6_X = -> (path) {
  # Rename README.md file, but not the top level README
  File.join(DESTINATION_DIR_V4_6_X, path.downcase.gsub('/readme.md', '.md'))
}
TRANSFORM_PATH_V4_5_X = -> (path) {
  # Rename README.md file, but not the top level README
  File.join(DESTINATION_DIR_V4_5_X, path.downcase.gsub('/readme.md', '.md'))
}
TRANSFORM_PATH_V4_1_X = -> (path) {
  # Rename README.md file, but not the top level README
  File.join(DESTINATION_DIR_V4_1_X, path.downcase.gsub('/readme.md', '.md'))
}
INCLUDE = [
  ->(path) { path.end_with?('.md') }
]
IGNORE = [
  ->(path) { path.include?('tests_suits') },
  ->(path) { path.start_with?('core/', '.github/', 'pact-publish/', 'pact-specification-test/', 'provider/scalasupport/', 'provider/scalatest/', 'provider/specs2/', 'ReleaseProcess.md') }
]
CUSTOM_ACTIONS = [
  [->(path) { path != 'CHANGELOG.md'}, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README"; md_file_contents.fields[:slug] = "./readme" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.fields[:title] = "Changelog"
    md_file_contents.remove_lines_including('To generate the log')
    md_file_contents.remove_lines_including('- chore: ')
    md_file_contents.remove_lines_including('- docs: ')
    md_file_contents.remove_lines_including('- doc: ')
    md_file_contents.remove_lines_including('- refactor: ')
    md_file_contents.remove_lines_including('- style: ')
    md_file_contents.remove_lines_including(' - Update ')
    md_file_contents.remove_lines_including(' - Revert "')
    md_file_contents.remove_lines_including(' - Merge branch ')
    md_file_contents.remove_lines_including(' - Merge pull request ')
    md_file_contents.remove_lines_including(' - bump version ')
    md_file_contents.remove_lines_including('<String>')
    md_file_contents.find_and_replace(/^# /, '## ')
  }],
  # can be removed once https://github.com/pact-foundation/pact-jvm/pull/1832/files is merged
  ["provider/maven/README.md", -> (md_file_contents) {
    md_file_contents.remove_lines_including('<TYPE>.<SUBTYPE>=text')
  }]
]

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH_V4_6_X, CUSTOM_ACTIONS)
sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH_V4_5_X, CUSTOM_ACTIONS, 'v4.5.x')
sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH_V4_1_X, CUSTOM_ACTIONS, 'v4.1.x')