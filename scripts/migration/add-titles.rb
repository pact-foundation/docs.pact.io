failures = []

#Dir['docs/**/*.md']
ARGV.each do | path |

  lines = File.readlines(path)
  heading_index = lines.find_index { | line | line.start_with?('#') }
  if heading_index
    title = lines.delete_at(heading_index).gsub(/^#+/, '').strip
    if lines.first.start_with?('---')
      lines.insert(1, "title: #{title}\n")
    else
      lines = ["---\n", "title: #{title}\n", "---\n"] + lines
    end

    if ENV['DRY_RUN'] == 'true'
      # puts lines.join
      puts "Good: #{path}"
    else
      File.open(path, "w") { |file| file << lines.join }
    end
  else
    failures << path
  end
end


if failures.any?
  puts "Could not find titles for the following files:\n\n" + failures.join("\n")
end
