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

doc = Kramdown::Document.new(File.read('docs/SUMMARY.md'))
list = doc.root.children.find { | child | child.type == :ul }

links = list.children.collect do | item |
  link_element = find_link_element(item)
  href = link_element.attr['href']
  link_text = link_element.children.first.value

  Link.new(link_text, href)
end

hash = links.each_with_object({}) do | link, hash |
  if link.href.end_with?('.md')
    hash[link.text] = [link.href.chomp('.md')]
  end
end

puts JSON.pretty_generate(hash)