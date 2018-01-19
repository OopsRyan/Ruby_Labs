require_relative "carnivore"

class Tiger < Carnivore
  def prey
    puts "Tiger #{@id} is preying on other animals...."
  end
end