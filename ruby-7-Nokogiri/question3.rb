

class Circle
  attr_accessor :radius

  def initialize(radius)
    @radius = radius
  end

  def half_perimeter
    @radius * Math::PI
  end

  def area
    @radius * half_perimeter
  end

  def perimeter
    # 2 * self.half_perimeter
    2 * half_perimeter
  end

  def get_perimeter
    self.perimeter
  end

  public :area
  protected :perimeter
  private :half_perimeter

end

circle = Circle.new(3)
puts circle.area
puts circle.get_perimeter
# puts circle.half_perimeter
# puts circle.perimeter
