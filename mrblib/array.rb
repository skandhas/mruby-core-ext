class Array

  ##
  # call-seq:
  #    ary.reject! {|item| block }  -> ary or nil
  #
  # Equivalent to <code>Array#delete_if</code>, deleting elements from
  # +self+ for which the block evaluates to true, but returns
  # <code>nil</code> if no changes were made.
  # The array is changed instantly every time the block is called and
  # not after the iteration is over.
  # See also <code>Enumerable#reject</code> and <code>Array#delete_if</code>.

  def reject!(&block)
    was = self.size
    each_index do |idx|
      if block.call(self[idx]) 
        delete_at(idx)
        redo if idx < self.size
      end  
    end
    self if was != self.size
  end

  ##
  # call-seq:
  #    ary.delete_if {|item| block }  -> ary
  #
  # Deletes every element of +self+ for which <i>block</i> evaluates
  # to true.
  # The array is changed instantly every time the block is called and
  # not after the iteration is over.
  # See also <code>Array#reject!</code>
  #
  #    a = [ "a", "b", "c" ]
  #    a.delete_if {|x| x >= "b" }   #=> ["a"]

  def delete_if(&block)
    self.reject!(&block) || self 
  end

  ##
  # call-seq:
  #    ary.compact!    -> ary  or  nil
  #
  # Removes +nil+ elements from the array.
  # Returns +nil+ if no changes were made, otherwise returns
  # <i>ary</i>.
  #
  #    [ "a", nil, "b", nil, "c" ].compact! #=> [ "a", "b", "c" ]
  #    [ "a", "b", "c" ].compact!           #=> nil

  def compact!
    self.reject!{|e| e.nil? }
  end

  ##
  #  call-seq:
  #     ary.compact     -> new_ary
  #
  #  Returns a copy of +self+ with all +nil+ elements removed.
  #
  #     [ "a", nil, "b", nil, "c", nil ].compact
  #                       #=> [ "a", "b", "c" ]
  def compact
    ary = self.dup
    ary.compact! || ary 
  end

  ##
  # call-seq:
  #    ary.select! {|item| block } -> ary or nil
  #
  # Invokes the block passing in successive elements from
  # +self+, deleting elements for which the block returns a
  # false value. It returns +self+ if changes were made,
  # otherwise it returns <code>nil</code>.
  # See also <code>Array#keep_if</code>

  def select!
    was = self.size
    each_index do |idx|
      unless yield(self[idx])
        delete_at(idx)
        redo if idx < self.size
      end
    end
    self if was != self.size
  end

  ##
  # call-seq:
  #    ary.keep_if {|item| block } -> ary
  #
  # Deletes every element of +self+ for which <i>block</i> evaluates
  # to false.
  # See also <code>Array#select!</code>
  #
  #    a = %w{ a b c d e f }
  #    a.keep_if {|v| v =~ /[aeiou]/}   #=> ["a", "e"]

  def keep_if(&block)
    self.select!(&block) || self
  end
end


