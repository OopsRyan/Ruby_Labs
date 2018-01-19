require 'nokogiri'
require 'pp'
require 'open-uri'

doc = Nokogiri::HTML(open("http://musicforprogramming.net/"))
title = doc.xpath("//title")

puts "Title: #{title[0].inner_text()}"
puts "Episodes: "

episode_array = doc.xpath("//div[@id='episodes']").xpath("//a")

episode_array.each do |episode|
  if episode.to_s =~ /\d\d:/ then
    puts episode.inner_text()
  end
end
