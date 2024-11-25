#!/usr/bin/env ruby
require_relative 'support'

SOURCE_REPO = 'pact-foundation/pact-python'
DESTINATION_DIR = relative_path_to('docs/implementation_guides/python')
TRANSFORM_PATH = lambda { |path|
  File.join(DESTINATION_DIR, path.downcase.gsub('/readme.md', '/index.md'))
} # Rename README.md to index.md, but not the top level README
INCLUDE = [
  ->(path) { %w[README.md CHANGELOG.md docs/consumer.md docs/provider.md examples/README.md].include?(path) }
]
IGNORE = [
  ->(path) { path.start_with?('.github/') }
]
CUSTOM_ACTIONS = [
  [->(path) { path != 'CHANGELOG.md' }, ->(md_file_contents) { md_file_contents.extract_title }],
  ['README.md', lambda { |md_file_contents|
    md_file_contents.fields[:title] = 'README'
    md_file_contents.fields[:slug] = './readme'
  }],
  ['CHANGELOG.md', lambda { |md_file_contents|
    md_file_contents.fields[:title] = 'Changelog'
  }],
  ['README.md', lambda { |md_file_contents|
    md_file_contents.find_and_replace(%r{<img([^>]*)(?<!/)>}, '<img\1 />')
    md_file_contents.find_and_replace(%r{(alt="[^"]*")></a>}, '\1/></a>')
    md_file_contents.find_and_replace(/<ul style="list-style-type: none">/, '')
    md_file_contents.find_and_replace(%r{</ul>}, '')
    md_file_contents.find_and_replace(/^\s*<li>/, '<li>')
  }],
  ['examples/README.md', lambda { |md_file_contents|
    md_file_contents.find_and_replace(%r{</br>}, '<br/>')
  }],
  [->(path) { path.end_with?('.md') }, lambda { |md_file_contents|
    md_file_contents.find_and_replace(/<!-- markdownlint-enable no-inline-html -->/, '')
  }]
]

sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS, 'main')
