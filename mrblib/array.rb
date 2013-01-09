class Array
  def reject!(&block)
    was = self.size
    each_index do |idx|
      if block.call(self[idx]) 
        delete_at(idx)
        redo if idx < self.size
      end  
    end
   # self if was != length  
   # mruby's bug
    if was != length  
      return self
    else  
      return nil
    end
  end

  def delete_if(&block)
    self.reject!(&block) || self 
  end

  def compact!
    self.reject!{|e| e == nil }
  end

  def compact
    ary = self.dup
    ary.compact! || ary 
  end
end


