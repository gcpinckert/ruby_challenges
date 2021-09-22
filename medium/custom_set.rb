class CustomSet
  def initialize(array=[])
    @set = {}
    array.each { |member| set[member] = member }
  end

  def empty?
    set.empty?
  end

  def contains?(possible_member)
    set.has_key?(possible_member)
  end

  def subset?(other_set)
    set.each { |member, _| return false unless other_set.contains?(member) }
    true
  end

  def disjoint?(other_set)
    set.each { |member, _| return false if other_set.contains?(member) }
    true
  end

  def eql?(other_set)
    self.subset?(other_set) && other_set.subset?(self)
  end
  alias == eql?

  def add(member)
    set[member] = member
    self
  end

  def intersection(other_set)
    results = CustomSet.new
    set.each { |member, _| results.add(member) if other_set.contains?(member) }
    results
  end

  def difference(other_set)
    results = CustomSet.new
    set.each do |member, _|
      results.add(member) unless other_set.contains?(member)
    end
    results
  end

  def union(other_set)
    results = self.dup
    set_to_add = other_set.difference(self)
    set_to_add.each { |member| results.add(member) }
    results
  end

  def each
    set.each { |member, _| yield(member) if block_given? }
    self
  end

  private

  attr_reader :set
end