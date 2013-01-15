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
end
