########## question 1

def seq_gen_a n
	array = Array.new
	if n <= 2 then
		array
	else
		4.times do |count|
			array << (n*2-3)
			n = n*2-3
		end
		array ###### dont forget!!!!!!!!!!!!
	end
end

def seq_gen_b (n, array=[])
	if array.length >= 4 || n <= 2 then
		array
	else
		array << (n*2-3)
		seq_gen_b(n*2-3, array)
	end
end

p seq_gen_a(5)
p seq_gen_b(5)

############ question 2

############ question 3

def pluralise array
	temp = Array.new
	array.each do |element|
		if element[element.length-1] == 'a' then
			temp << element.to_s+'e'
		elsif element[element.length-1] == 'i' then
			temp << element.to_s+'s'
		else 
			temp << element
		end
	end
	return temp.collect{|a| a.to_sym}
end

p pluralise [:alpha, :beta, :kappa, :phi]
		
def pluralise_sub array
	temp = Array.new
	array.each do |element|
		if element[element.length-1] == 'a' then
			temp << element.to_s.gsub(element.to_s, element.to_s+'e').to_sym
		elsif element[element.length-1] == 'i' then
			temp << element.to_s.gsub(element.to_s, element.to_s+'s').to_sym
		else 
			temp << element
		end
	end
	return temp.collect{|a| a.to_sym}
end

p pluralise_sub [:alpha, :beta, :kappa, :phi]

