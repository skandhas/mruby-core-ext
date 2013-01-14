class Hash

  ##
  # call-seq:
  #    hsh.delete_if {| key, value | block }  -> hsh
  #
  # Deletes every key-value pair from <i>hsh</i> for which <i>block</i>
  # evaluates to <code>true</code>.
  #
  #    h = { "a" => 100, "b" => 200, "c" => 300 }
  #    h.delete_if {|key, value| key >= "b" }   #=> {"a"=>100}

  def delete_if(&block)
    self.reject!(&block) || self
  end  

  ##
  # call-seq:
  #    hsh.keep_if {| key, value | block }  -> hsh
  #
  # Deletes every key-value pair from <i>hsh</i> for which <i>block</i>
  # evaluates to false.

  def keep_if(&block)
    self.select!(&block) || self
  end

  ##
  # call-seq:
  #    hsh.invert -> new_hash
  #
  # Returns a new hash created by using <i>hsh</i>'s values as keys, and
  # the keys as values.
  #
  #    h = { "n" => 100, "y" => 300, "d" => 200, "a" => 0 }
  #    h.invert   #=> {0=>"a", 100=>"n", 200=>"d", 300=>"y"}

  def invert
    h = {}
    self.each { |k, v| h[v] = k }
    h
  end
end
