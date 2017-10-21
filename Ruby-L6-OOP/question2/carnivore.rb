require_relative "animal"

class Carnivore < Animal
  def eat_meat
    puts "Carnivore #{@id} is eating meat"
  end
end