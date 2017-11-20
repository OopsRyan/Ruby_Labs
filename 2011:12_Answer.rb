
#### question 1

def method_1(a)
	20.times do |count|
		a << a[count]+a[count+1]
	end
	a # remember to add or it returns 20; and  count will begin at 0 and end with 19
end


# add i as the default parameter; tail recursion
def method_2(a,i=0)
	if i==20 then
		a # the outlet of this method
	else
		method_2(a<<a[i]+a[i+1], i+1)
	end
end

p method_1([0,1])
p method_2([0,1])


## question 2
class Furniture
	attr_accessor :id,:weight, :width, :height
	
	def initialize(weight, width, height)
		@weight = weight
		@width = width
		@height = height
		@id = object_id
	end

	def get_id
		puts @id
	end

	def print_weight
		puts @weight
	end

	def print_width_height
		puts "width is "+@width.to_s+", height is "+@height.to_s
	end
end

class Chair < Furniture
	attr_accessor :legs

	def initialize(legs)
		@legs = legs
	end

	def get_legs
		@legs
	end

end

class DesignerChair < Chair
	attr_accessor :style

	def initialize(style)
		@style = style
	end

	def get_style
		@style
	end
end

p Furniture.new(1,2,3)
p Chair.new(4)
p DesignerChair.new("European")

## a module is a abstract class which cannot be initialized as an instance of any class, but can be inherited with some methods by classes.
## the reason why ruby use modules is a method allow classes to inherit some certian methods from it, so these methods can be inherited repeated 
## rather than redefined several times.

######### question 3
def insert_blah(target_array)
	return_array = []
	target_array.each do |element|
		return_array << (element.include?("blah") ? element : element+"blah")
	end
	return_array # dont lose it 
end

def insert_blah_2(target_array)
end

def chac_numbers_blah(target_array)
	return_array = []
	target_array.each do |element|
		return_array << element.index("blah")
	end
	# dont lose it 
end

temp = insert_blah(["marky", "had", "a", "blah", "lamb"])
p temp
p chac_numbers_blah(temp)

########### question 4