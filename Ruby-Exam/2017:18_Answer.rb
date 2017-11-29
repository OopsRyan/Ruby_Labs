def pluralise(array)
	array.collect do |e|
		if e[e.length-1].to_s == "a" then
			e.to_s.concat("e").to_sym
		elsif e[e.length-1].to_s == "i" then
			e.to_s.concat("s").to_sym
		else
			e
		end
	end
end

def pluralise_sub(array)
	array.collect do |e|
		if e[e.length-1].to_s == "a" then
			e.to_s.sub(e.to_s, e.to_s.concat("e")).to_sym
		elsif e[e.length-1].to_s == "i" then
			e.to_s.sub(e.to_s, e.to_s.concat("s")).to_sym
		else
			e
		end
	end
end

a = [:alpha,:beta, :kappa, :phi]

# p pluralise(a)
# p pluralise_sub(a)
			

