#!/usr/bin/env ruby

require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-plugins'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/pact_plugins')
CLI_DESTINATION_DIR = relative_path_to('docs/implementation_guides/cli')
TRANSFORM_PATH = lambda { |path|
  if path == "cli/README.md"
    "#{CLI_DESTINATION_DIR}/pact-plugin.md"
  elsif path == "cli/CHANGELOG.md"
    "#{CLI_DESTINATION_DIR}/pact-plugin/changelog.md"
  elsif path.include?('proposals') && !path.downcase.include?("readme")
    p = Pathname.new(path)
    File.join(DESTINATION_DIR, p.dirname, "proposal_#{p.basename.to_s.downcase}")
  else
  File.join(DESTINATION_DIR, path.downcase)
  end
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
  [->(path) { path.include?('cli') }, lambda { |md_file_contents|
                                            md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}/tree/main/cli\n")
                                          }],
  [->(path) { path.include?('plugin-driver-design.md') }, lambda { |md_file_contents|
                                                            md_file_contents.escape_things_that_look_like_jsx_tags
                                                          }],
  [->(path) { path.include?('proposals') && path.downcase.include?('readme') },  lambda { |md_file_contents|                                                       
                                                      md_file_contents.fields[:title] = "Overview" 
                                                    }],
  ["cli/README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Pact Plugin" } ],
  ["cli/CHANGELOG.md", ->(md_file_contents) { md_file_contents.fields[:title] = "pact-plugin-cli" } ],

]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS, 'main')
