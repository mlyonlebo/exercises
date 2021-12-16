class Element
  attr_accessor :datum, :next
  
  def initialize(datum, next_datum=nil)
    @datum = datum 
    @next = next_datum
  end

  def tail?
    self.next == nil
  end
end

class SimpleLinkedList
  attr_accessor :list
  
  def self.from_a(arr)
    new_list = SimpleLinkedList.new
    unless arr.nil?
      arr.reverse.each do |element|
        new_list.push(element)
      end
    end
    new_list
  end
  
  def initialize
    @list = []
  end

  def to_a
    list.map do |element|
      element.datum
    end.reverse
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def push(datum)
    new_element = Element.new(datum, head)
    list << new_element
  end

  def head
    list.last
  end

  def size
    list.size
  end

  def empty?
    list.size == 0
  end

  def peek
    empty? ? nil : head.datum
  end

  def pop
    empty? ? nil: list.pop.datum
  end
end



a = SimpleLinkedList.new
a.push(2)
a.push(1)
p a
p SimpleLinkedList.from_a([1, 2])
