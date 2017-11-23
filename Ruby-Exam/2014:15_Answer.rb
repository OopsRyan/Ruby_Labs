######## question1
class Fixnum
	def is_prime?
		flag = true
		(1..self).to_a.each do |i|
			if (self%i == 0) && self != i && i != 1 then
				flag = false
			end
		end
		flag
	end
end

p 13.is_prime?
p 10.is_prime?

def find_primes1
	i = 1
	array = Array.new
	
	while array.length < 20 do 
		if i.is_prime? and i != 1 then 
			array << i
		end
		i += 1
	end
	array
end

def find_primes2(i=1,array=[])
	if array.length >= 20 then 
		array
	else
		if i.is_prime? && i != 1 then
			array << i
		end
		find_primes2(i+=1, array)
	end
end

p find_primes1
p find_primes2




# class A
# 	def self.b
# 		p "b"
# 	end
# end

# A.b
# A::b
# a = A.new
# a.b
# a::b
