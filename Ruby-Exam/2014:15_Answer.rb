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

############### question 2

module ClearForest
	def cut_down
		if self.living then
			self.living = false
		end
		nil
	end
end

class Tree
	include ClearForest ## mixin
	attr_accessor :living, :species, :age

	def initialize(species, age, living=true)
		@living = living
		@species = species
		@age = age
	end

	def is_living?
		@living
	end

	def how_old?
		@age
	end
end

class ConiferousTree < Tree
	attr_accessor :height, :radius, :name, :region, :color
	def initialize(height, radius, name, region, color)
		@height = height
		@radius = radius
		@name = name
		@region = region
		@color = color
	end

	def classify_size
		if height.instance_of?(Fixnum) then
			(height >= 10) ? "tall" : "small"
		end
	end
end

p a = Tree.new(true,"tree",20)
p a.is_living?
p a.how_old?
p a.cut_down
p a.is_living?

p b = ConiferousTree.new(20, 1, "coniferous", "IRE", "red")
p b.living = true
p b.classify_size
p b.cut_down
p b.is_living?




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
