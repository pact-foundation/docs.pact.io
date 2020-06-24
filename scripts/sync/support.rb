class MarkdownFileContents
  attr_reader :lines, :fields, :comments

  def initialize(lines, fields = {}, comments = [])
    @lines = lines
    @fields = fields
    @comments = comments
  end

  def extract_title
    heading_underline_index = lines.find_index{ |line| line.start_with?("======") }

    if heading_underline_index && heading_underline_index > 0
      lines.delete_at(heading_underline_index)
      title = lines.delete_at(heading_underline_index - 1).strip
      self.fields[:title] = title
    else
      heading_index = lines.find_index { | line | line.start_with?('#') }
      if heading_index
        title = lines.delete_at(heading_index).gsub(/^#+/, '').strip
        self.fields[:title] = title
      else
        raise "Could not find a heading for page with head lines #{lines[0..5].join}"
      end
    end
  end

  def to_s
    ["---", header_lines, "---", comments, lines].flatten.join("\n") + "\n"
  end

  private

  def header_lines
    [:title, :custom_edit_url, :description].collect do | key |
      if fields[key]
        "#{key}: #{fields[key]}"
      end
    end.compact
  end
end

def get_file_list(repository_slug, include_conditions, exclude_conditions = [])
  client = Octokit::Client.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
  client.auto_paginate = true
  tree = client.tree(repository_slug, 'master',  recursive: true).tree
  markdown_files = tree.select do | file |
    include_conditions.any?{ |lambda| lambda.call(file.path) } && !exclude_conditions.any? { |lambda| lambda.call(file.path) }
  end
end

def each_file(files)
  files.each do | file |
    file_resource = file.rels[:self].get
    yield file.path, Base64.decode64(file_resource.data.content)
  end
end

def process_file(path, content, path_transformer, custom_actions, comment)
  destination = path_transformer.call(path)
  fields = { custom_edit_url: "https://github.com/#{SOURCE_REPO}/edit/master/#{path}" }
  md_file_contents = MarkdownFileContents.new(content.split("\n"), fields, [comment])
  md_file_contents.extract_title
  custom_actions.select{ | source_path , _ | source_path == path }.collect(&:last).each { |action| action.call(md_file_contents) }

  puts "Writing file #{destination}"
  FileUtils.mkdir_p(File.dirname(destination))
  File.open(destination, "w") { |file| file << md_file_contents.to_s }
end
