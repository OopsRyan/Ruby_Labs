class Animal
  attr_accessor :eye, :mouth, :leg, :skin_colour, :id

  def initialize(eye, mouth, leg, skin_colour)
    @eye = eye
    @mouth = mouth
    @leg = leg
    @skin_colour = skin_colour
    @id = object_id
  end

  def cry
      puts "Animal #{@id} ememememememme"
  end

  def walk
      puts "Animal #{@id} is walking...."
  end

  def eat
      puts "Animal #{@id} is eating....delicious food"
  end
end