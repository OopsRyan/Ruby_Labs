require_relative "animal"
require_relative "carnivore"
require_relative "tiger"

puts "--- Animal"
animal = Animal.new(2, "Small", 2, "grey")
animal.cry
animal.eat
animal.walk
# animal.eat_meat
# animal.prey

puts "--- Carnivore"

carnivore = Carnivore.new(4, "Big", 4, "red")
carnivore.cry
carnivore.eat
carnivore.walk
carnivore.eat_meat
# carnivore.prey

puts "--- Tiger"

tiger = Tiger.new(2, "Big", 4, "yellow")
tiger.cry
tiger.eat
tiger.walk
tiger.eat_meat
tiger.prey