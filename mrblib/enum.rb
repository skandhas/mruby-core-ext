module Enumerable

  ##
  # call-seq:
  #    enum.drop(n)               -> array
  #
  # Drops first n elements from <i>enum</i>, and returns rest elements
  # in an array.
  #
  #    a = [1, 2, 3, 4, 5, 0]
  #    a.drop(3)             #=> [4, 5, 0]

  def drop(n)
    n = n.to_int
    raise ArgumentError, "attempt to drop negative size" if n < 0

    self[n, self.size] 
  end

  ##
  # call-seq:
  #   enum.each_cons(n) {...}   ->  nil
  #
  # Iterates the given block for each array of consecutive <n>
  # elements.  If no block is given, returns an enumerator.
  #
  # e.g.:
  #     (1..10).each_cons(3) {|a| p a}
  #     # outputs below
  #     [1, 2, 3]
  #     [2, 3, 4]
  #     [3, 4, 5]
  #     [4, 5, 6]
  #     [5, 6, 7]
  #     [6, 7, 8]
  #     [7, 8, 9]
  #     [8, 9, 10]

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

  ##
  # call-seq:
  #   enum.each_slice(n) {...}  ->  nil
  #
  # Iterates the given block for each slice of <n> elements.
  #
  # e.g.:
  #     (1..10).each_slice(3) {|a| p a}
  #     # outputs below
  #     [1, 2, 3]
  #     [4, 5, 6]
  #     [7, 8, 9]
  #     [10]

  def each_slice(n)
    n = n.to_int 
    raise ArgumentError, "invalid slice size: #{n}" if n <= 0

    ary = []
    self.each do |e|
      ary << e
      if ary.size == n
        yield ary
        ary = []
      end
    end
    yield ary unless ary.empty?
  end

  ##
  # call-seq:
  #    enum.group_by {| obj | block }  -> a_hash
  #
  # Returns a hash, which keys are evaluated result from the
  # block, and values are arrays of elements in <i>enum</i>
  # corresponding to the key.
  #
  #    (1..6).group_by {|i| i%3}   #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}

  def group_by
    h = {}
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

  ##
  # call-seq:
  #    enum.take(n)               -> array
  #
  # Returns first n elements from <i>enum</i>.
  #
  #    a = [1, 2, 3, 4, 5, 0]
  #    a.take(3)             #=> [1, 2, 3]

  def take(n)
    n = n.to_int
    raise ArgumentError, "attempt to take negative size: #{n}" if n < 0

    ary = []
    self.each do |e|
      break if ary.size >= n
      ary << e
    end
    ary
  end

end
