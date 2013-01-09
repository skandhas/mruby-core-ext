module Enumerable
  def drop(n)
    n = n.to_int
    raise ArgumentError, "attempt to drop negative size" if n < 0

    self[n, self.size] 
  end

  def each_cons(n)
    n = n.to_int 
    raise ArgumentError, "invalid size: #{n}" if n <= 0

    ary = []
    self.each do |e|
      ary << e
      ary.shift if ary.size > n
      yield ary.dup if ary.size == n
    end
  end

  def each_slice(n)
    n = n.to_int 
    raise ArgumentError, "invalid slice size: #{n}" if n <= 0

    ary = []
    self.each do |e|
      ary << e
      if ary.size == n
        yield ary;
        ary = []
      end
    end
    yield ary unless ary.empty?
  end

  def group_by
    h = {}
    i = 0
    self.each do |e|
      key = yield(e)
      if h.key?(key)
        h[key] << e
      else
        h[key] = [e]
      end
    end
    h
  end
end
