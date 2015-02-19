class Sort
  attr_reader :array,:strray,:intray

  def initialize(array)
    @array = array
    @strray = []
    @intray = []
  end

  def filter_type()
    @array.each do |i|
      if i.is_a?String
        @strray << i
      elsif i.is_a?Integer
        @intray << i
      end
    end
  end

end

=begin
array = ['Banana',23,'Apple','Grapes','Kiwi',7,8,'Strawberry']

fruit = Sort.new(array)
fruit.filter_type
puts fruit.intray
=end