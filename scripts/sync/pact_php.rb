#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-php'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/php')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase) }
INCLUDE = [
  ->(path) { %w{README.md}.include?(path) },
  ->(path) { %w{README.md DEVELOPING.md UPGRADE-10.0.md}.include?(path) },
  ->(path) { path.start_with?('docs') && path.end_with?('md') }
]
IGNORE = []
CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Readme"; md_file_contents.fields[:slug] = "./readme" } ],
  ["CHANGELOG.md", -> (md_file_contents) {
    md_file_contents.clean_up_changelog
    }],
  ["UPGRADE-10.0.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Upgrading to 10.x" } ],
  ["docs/SOFTWARE-HISTORY.md", ->(md_file_contents) { md_file_contents.fields[:title] = "History" } ],
  ["docs/RELEASING.md", ->(md_file_contents) { md_file_contents.fields[:title] = "Releasing" } ],
]


FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)