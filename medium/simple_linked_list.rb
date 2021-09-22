class Element
  attr_reader :datum

  def initialize(datum, next_ele=nil)
    @datum = datum
    @next_ele = next_ele
  end

  def tail?
    !@next_ele
  end

  def next
    @next_ele
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def push(datum)
    if list.empty?
      list.unshift(Element.new(datum))
    else
      list.unshift(Element.new(datum, list.first))
    end
  end

  def pop
    list.shift.datum
  end

  def empty?
    list.empty?
  end

  def size
    list.size
  end

  def peek
    list.empty? ? nil : list.first.datum
  end

  def head
    list.first
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    return new_list if array.nil?

    array.reverse.each { |data| new_list.push(data) }
    new_list
  end

  def to_a
    list.map(&:datum)
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  private
  attr_reader :list
end
