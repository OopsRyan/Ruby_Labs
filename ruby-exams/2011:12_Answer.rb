
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

def char_numbers_blah(target_array)
	return_array = []
	target_array.each do |element|
		return_array << element.index("blah")
	end
	# dont lose it 
end

temp = insert_blah(["marky", "had", "a", "blah", "lamb"])
p temp
p char_numbers_blah(temp)

########### question 4

########### question 5

########### question 6
########### csv read all the things as strings. must convert data type when adding them into arrays
first_names = []
ages = []
height = 0
require 'csv'
CSV.foreach("students.csv", :headers => true) do |row|
	p row
	first_names << row["name"]
	ages << (Float row["age"])
	height += Float row["height"]
end

p first_names
p ages.reduce(:+)/ages.length
puts height

########### question 7
puts "hammy hamster"
# return nil print hammy hamster on the screen

a="foo"
p a
# "foo"

p ["a","b","c"].instance_of?(String)
# false

p ["a","b","c"].instance_of?(Array)
# true

class OddClass
end
p OddClass.new
# print the details of an instance of OddClass. <#OldClass >

p [1,2,3].collect {|x| x - 1}
# [0,1,2]


["a","b","c"].each{|item| puts item + 2}
# error, string cannot add a Fixnum

["a1","b2","c3"].select {|item| item[1] == 2}
# []

p [[2,3],[[[3]],[4,5]]].length
# ==============> 2!!!

p [1,2,[3,4],4,2,[[3,[6,2,1]]],145,4,3,2].flatten
#===============> [1,2,3,4,4,2,3,6,2,1,145,4,3,2]. # remove all [] and extract all elements from them

p Array.new
# []

p ["fooington"].concat("barrington")
#===============> error. concat only works with instances of the same class 

p ["foowich"].concat(["barwith"])
#===============> ["foowich", "barwith"]

a = ["foowich"]; a << ["barwith"]; p a
# ["foowich",["barwith"]]

p "fooblinggg".chop.chop.chop
# "fooblin" # chop removes the last character each time

p "baDDarT".downcase
# "baddart"

p "apples,oranges,lemons".split(/,/)
# ["apples", "oranges", "lemons"]

p "1234" <=> "12345"
#=================> -1, <=> works with the class implementing Comparable modules, then can be compared with other instances 

p Regexp.new("floppy")
# /floppy/

p ("two" + 2 + " equals" +  "4")
# error. string cannot add Fixnum



