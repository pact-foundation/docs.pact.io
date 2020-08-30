#!/usr/bin/env ruby

require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-net'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/net')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase) }
INCLUDE = [
  ->(path) { %w{README.md}.include?(path) }
]
IGNORE = []

CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) { md_file_contents.extract_title } ],
  [:all, ->(md_file_contents) { md_file_contents.find_and_replace("```c#", "```csharp") } ],
  ["README.md", ->(md_file_contents) { md_file_contents.fields[:title] = "README" } ]
]


FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)
