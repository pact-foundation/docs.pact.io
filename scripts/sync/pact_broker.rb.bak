#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'

PROJECT_ROOT = File.expand_path(File.join(__FILE__, '..', '..', '..'))
SYNCED_CONTENT_DIR = File.join(PROJECT_ROOT, 'docs', 'synced-content')
API_DOCS_DIR = 'lib/pact_broker/doc/views'

FileUtils.mkdir_p SYNCED_CONTENT_DIR

def sync(path, content)
  destination = File.join(SYNCED_CONTENT_DIR, path)
  puts "Writing file #{destination}"
  FileUtils.mkdir_p(File.dirname(destination))
  File.open(destination, "w") { |file| file << content }
end

def each_file(files)
  files.each do | file |
    file_resource = file.rels[:self].get
    yield file.path, Base64.decode64(file_resource.data.content)
  end
end

client = Octokit::Client.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
client.auto_paginate = true

tree = client.tree('pact-foundation/pact_broker', 'master',  recursive: true).tree

markdown_files = tree.select{ | file | file.path.end_with?('.md') }[0..3]

api_doc_files = tree.select { | file | file.path.start_with?('lib/pact_broker/doc/views') && file.path.end_with?('.markdown') }

each_file(api_doc_files) do | path, content |
  new_path = path[API_DOCS_DIR.size .. -1].gsub(/\.markdown$/,  '.md')
  sync(new_path, content)
end
