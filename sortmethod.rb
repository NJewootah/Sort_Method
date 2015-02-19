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

  def order_elements(array)
    sorted = false
    until sorted
      sorted = true
      (array.count - 1).times do |i|
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
          sorted = false
        end
      end
    end
  end

  def sort()
    filter_type
    @sttray = order_elements(@strray)
    @intray = order_elements(@intray)
    @array = Array.new
    @array << @intray

  end
end


array = ['Banana',23,'Apple','Strawberry','Kiwi',7,8,'Grapes']

fruit = Sort.new(array)
fruit.sort
puts fruit.array
