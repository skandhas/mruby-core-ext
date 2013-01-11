class Float 
  alias to_int to_i 
end

class Integer
  def denominator; 1    end
  def integer?;    true end
  def numerator;   self end
end

class Fixnum 
  alias to_int to_i 
end
