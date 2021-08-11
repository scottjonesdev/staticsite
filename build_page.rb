require 'erb'
require 'kramdown'

def render(partial_path)
  ERB.new(File.read(partial_path)).result(binding)
end

def content
  output = ""
  Dir.foreach("./posts") do |post_filename|
    if post_filename.include?("md")
      output.concat(Kramdown::Document.new(File.read("./posts/#{post_filename}")).to_html)
    end
  end
  return output
end

template = ERB.new(File.read('template.html.erb'))
puts template.result(binding)
