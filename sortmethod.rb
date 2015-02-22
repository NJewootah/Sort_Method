require 'yaml'

class Sort
  attr_reader :strray,:intray,:sorted_array

  def initialize(array)
    filter_param(array)
    order_elements(@strray)
    order_elements(@intray)
    merge_array
  end

  def filter_param(object)
    if object.is_a?Array
      filter_type(object)
    else
      file = File.open(object)
      data = YAML.load(file)
      filter_type(data)
      raise 'Incorrect object parsed. Object has to be an array or yml file' unless File.extname(file) == '.yml'
    end
  end

  def filter_type(array)
    @strray = []
    @intray = []
    array.each do |i|
      if i.is_a?String
        @strray << i
      elsif i.is_a?Integer
        @intray << i
      else
        array.pop(i)
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

  def merge_array()
    @sorted_array = []
    @sorted_array.concat(@intray)
    @sorted_array.concat(@strray)
  end

end