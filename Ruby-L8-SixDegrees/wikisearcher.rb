#  WIKISEARCHER
#  Created by Mark Keane on 27/09/2011.
#  Copyright (c) 2011 Mark Keane. All rights reserved.

# WIKISEARCHER: A class that takes the Nokogiri parses and searches them for films or actors.
# It uses a simple object tha has just 2 attributes; one that holds the parse, one that holds its title.

class WikiSearcher
 
  def initialize(doc_parse)
	@doc = doc_parse
	@title = (@doc.search("//title").inner_text).gsub(" - Wikipedia, the free encyclopedia", "") 
  end

# FIND_FILMS_BY_ACTOR: Takes an actor-page parsed in Nokogiri and searches it for all links (hrefs).
# It then extracts the string-uri and if it contains "film)" then it assumes its a film. It returns
# the list of film-names not their full string-uris.

	def find_films_by_actor(out = [])
		puts "     ***** Entering find_films_by_actor with #{@title}."

	  	film_table = @doc.xpath("//span[@id='Filmography']")
	  	out = []
		if !film_table.empty? then
			puts " ============== film tables ============="
			trs = film_table.first.parent.next_element.next_element.children

			trs = trs.select do |tr|
				tr.children.select{|node| node.name == "td"}.length > 0
			end

			trs.each do |tr|
				a_tag = tr.children.select{|node| node.name == "td"}[1].children.children
				if !a_tag.empty? && !a_tag.attr("href").nil? then 
					out << a_tag.attr("href").value
				end
			end

		else
		 	all_links = @doc.search('//a[@href]')
	 	 	all_links.each do |link|
				link_info = link['href']
				if !link_info.nil? && link_info.include?("film)") && !(link_info.include?("Category:") || link_info.include?("php"))
					then out << link_info end
			end
			# out = out.uniq.collect {|link| link.strip_out_name}
		end
		# out = out.uniq.collect {|link|
		# 	begin
		# 		p link
		# 		 link.strip_out_name
		# 	rescue NoMethodError => the_error
		#    		puts "Error, strip_out_name "
		#    		p link
		# 	end
		# }
		out = out.uniq.collect {|link| link.strip_out_name}
		out
	end

  
 
# FIND_ACTORS_IN_FILM: Takes an film-page parsed in Nokogiri and searches it the table headed "starring"
# It then extracts the links within it (hrefs) and assumes they are actors.  Most of the time they are.
# It returns the list of actor-names not their full string-uris.


  def find_actors_in_film(out = [])
	  puts "     ***** Entering find_actors_in_film with #{@title}."
 	  all_tables = @doc.search("//tr")
 	  all_tables.each do |tr_node|
	     tr_childs_less_newline_nodes = tr_node.children.select {|node| !(node.inner_text == "\n")}
	     starring_node = tr_childs_less_newline_nodes[0]
	     if starring_node.inner_text == "Starring"
	       then rest_of_childs = tr_childs_less_newline_nodes[1].children
		      rest_of_childs.each {|node| if node['href'] then out << node['href'] end}
	     end
	  end
  	out.uniq.collect {|link| link.strip_out_name}
  end

end

