class Symbol
  ##
  # call-seq:
  #   sym.length    -> integer
  #
  # Same as <code>sym.to_s.length</code>.
  
  def length
    self.to_s.length
  end
  alias :size :length

  ##
  # call-seq:
  #   sym.capitalize  -> symbol
  #
  # Same as <code>sym.to_s.capitalize.intern</code>.

  def capitalize
    self.to_s.capitalize.intern
  end
end
