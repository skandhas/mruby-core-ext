assert("Array#reject!") do
  a = [1, 2, 3, 4]
  a.reject!{|x| x > 2 } == [1, 2] and 
  a.reject!{|x| x > 5 } == nil 
end

assert("Array#delete_if") do
  a = [ "a", "b", "c" ]
  a.delete_if {|x| x >= "b" } == ["a"] and
  a.delete_if {|x| x >= "e" } == a
end

assert("Array#compact!") do
 [ "a", nil, "b", nil, "c" ].compact! == ["a", "b", "c"] and
 [ "a", "b", "c" ].compact! ==nil
end

assert("Array#compact") do
 [ "a", nil, "b", nil, "c" ].compact == ["a", "b", "c"] and
 [ "a", "b", "c" ].compact == [ "a", "b", "c" ] 
end

