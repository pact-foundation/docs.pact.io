#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'ludorival/pact-jvm-mock'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/jvm/consumer')
TRANSFORM_PATH = -> (path) {
  File.join(DESTINATION_DIR, 'pact-jvm-mock.md')
}
INCLUDE = [
  ->(path) { path == 'README.md' }
]
IGNORE = []
CUSTOM_ACTIONS = [
  ["README.md", ->(md_file_contents) { 
    md_file_contents.extract_title
    md_file_contents.fields[:title] = "Pact JVM Mock"
    md_file_contents.fields[:slug] = "./consumer/pact-jvm-mock"
  }]
]

FileUtils.mkdir_p DESTINATION_DIR

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS, 'main')

