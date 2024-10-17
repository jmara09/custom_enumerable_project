module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    count = 0
    my_each do |element|
      block.call(element, count)
      count += 1
    end
  end

  def my_select(&block)
    array = []
    my_each do |element|
      array << element if block.call(element)
    end
    array
  end

  def my_all?(&block)
    array = []
    my_each do |element|
      array << block.call(element)
    end

    array.uniq.join == 'true'
  end

  def my_any?(&block)
    my_each do |element|
      return true if block.call(element)
    end
    false
  end

  def my_none?
    array = []
    my_each do |element|
      yield(element) ? array.push(true) : array.push(false)
    end

    array.uniq.join == 'false'
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    array = []
    my_each do |element|
      array << yield(element)
    end
    array
  end

  def my_inject(value = 0)
    initial = value
    my_each do |element|
      initial = yield(initial, element)
    end
    initial
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    for element in self
      block.call(element)
    end
  end
end
