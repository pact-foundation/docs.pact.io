#!/usr/bin/env ruby

require 'kramdown'
require 'json'

def find_link_element(item)
  element = item

  while element && !is_link?(element) do
    element = first_child(element)
  end

  element
end

def is_link?(element)
  element.respond_to?(:attr) && element.attr['href']
end

def first_child(element)
  if element.respond_to?(:children)
    element.children.first
  else
    nil
  end
end

def find_link_text(item)

end

Link = Struct.new(:text, :href)

def handle_elements(element, structure)
  # find the first UL
  ul = element.children.find { | child | child.type == :ul }

  return unless ul



  ul.children.each do | item |

    link_element = find_link_element(item)
    href = link_element.attr['href'].chomp('.md')
    link_text = link_element.children.first.value
    link = Link.new(link_text, href)

    structure[link] = {}


    handle_elements(item, structure[link])
  end
end

doc = Kramdown::Document.new(File.read('docs/SUMMARY.md'))
list = doc.root.children.find { | child | child.type == :ul }

structure = {}
handle_elements(doc.root, structure)

def walk_tree(hash, prefix = "")
  hash.each do | key, value |
    puts "#{prefix} #{key}"
    if value.is_a?(Hash)
      walk_tree(value, prefix + "    ")
    end
  end
end

#walk_tree structure

sidebars = {}

structure.each do | key, value |
  next if key.href.start_with?('http')

  sidebars[key.text] = [key.href]

  value.each do | link, children |

    if children.any?
      child_links = [link.href] + children.keys.collect{ |link| link.href }



      sidebars[key.text] << {
        "type" => "subcategory",
        "label" => link.text,
        "ids" => child_links
      }
    else
      sidebars[key.text] << link.href
    end

  end

  children_have_children = value.values.any?(&:any?)
  hrefs = value.keys.collect(&:href)

  sidebars[key.text].concat(hrefs)

  # if children_have_children
  #   child_links = value.keys.collect{ |link| link.href }

  #   sidebars[key.text] << {
  #     "type" => "subcategory",
  #     "label" => "something",
  #     "ids" => child_links
  #   }
  # end
end

puts JSON.pretty_generate(sidebars)


# links = list.children.collect do | item |
#   link_element = find_link_element(item)
#   href = link_element.attr['href']
#   link_text = link_element.children.first.value

#   require 'pry'; pry(binding);

#   ul = item.children.find { |c| c.type == :ul }

#   Link.new(link_text, href)
# end

# hash = links.each_with_object({}) do | link, hash |
#   if link.href.end_with?('.md')
#     hash[link.text] = [link.href.chomp('.md')]
#   end
# end

# puts JSON.pretty_generate(hash)