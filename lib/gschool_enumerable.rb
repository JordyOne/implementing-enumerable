module GschoolEnumerable
  def g_each # (block) for explicit
    for item in self
      yield(item) # yield control to the block and return itself implicit
      # block.call(item) #explicit block
    end
    return self
  end

  def g_select
    arr = []
    self.g_each do |item|
      arr << item if yield(item)
    end
    arr
  end

  def g_reject
    arr = []
    self.g_each do |item|
      arr << item unless yield(item)
    end
    arr
  end

  def g_map
    arr = []
    self.g_each do |item|
      arr << yield(item)
    end
    arr
  end

  def g_find
    self.g_each do |item|
      if yield(item)
        return item
      end
    end
    nil
  end

  def g_select!
    self.g_each do |value|
      self.delete(value) unless yield(value)
    end
    self
  end

end
