#!/usr/bin/env ruby

require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-plugins'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/pact_plugins')
TRANSFORM_PATH = lambda { |path|
  File.join(DESTINATION_DIR, path.downcase)
}
INCLUDE = [
  ->(path) { path.end_with?('.md') }
]
IGNORE = [
  ->(path) { path.include?('vendor/') }
]

CUSTOM_ACTIONS = [
  [:all, lambda { |md_file_contents|
    md_file_contents.extract_title
    md_file_contents.fields[:sidebar_label] = md_file_contents.fields[:title]
  }],
  ['README.md', lambda { |md_file_contents|
                  md_file_contents.fields[:title] = 'Overview'
                  md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/\n")
                }],
  [->(path) { path.include?('CHANGELOG.md') }, ->(md_file_contents) { md_file_contents.fields[:title] = 'Changelog' }],
  [->(path) { path.include?('examples') }, lambda { |md_file_contents|
                                             md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/main/examples\n")
                                           }],
  [->(path) { path.include?('drivers') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/main/drivers\n")
                                          }],
  [->(path) { path.include?('plugins') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/main/plugins\n")
                                          }],
  [->(path) { path.include?('plugin-driver-design.md') }, lambda { |md_file_contents|
                                                            md_file_contents.escape_things_that_look_like_jsx_tags
                                                          }]
]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS, 'main')
