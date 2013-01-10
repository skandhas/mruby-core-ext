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
    self.select!(&block) || self.clear 
  end
end
