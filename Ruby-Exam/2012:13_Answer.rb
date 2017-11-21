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
		