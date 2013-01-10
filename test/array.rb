assert("Array::try_convert") do
  Array.try_convert([1]) == [1] and
  Array.try_convert("1").nil?
end

assert("Array#assoc") do
  s1 = [ "colors", "red", "blue", "green" ]
  s2 = [ "letters", "a", "b", "c" ]
  s3 = "foo"
  a  = [ s1, s2, s3 ]

  a.assoc("letters") == [ "letters", "a", "b", "c" ] and
  a.assoc("foo").nil?
end

assert("Array#reject!") do
  a = [1, 2, 3, 4]
  a.reject!{|x| x > 2 } == [1, 2] and 
  a.reject!{|x| x > 5 }.nil?
end

assert("Array#delete_if") do
  a = [ "a", "b", "c" ]
  a.delete_if {|x| x >= "b" } == ["a"] and
  a.delete_if {|x| x >= "e" } == a
end

assert("Array#compact!") do
 [ "a", nil, "b", nil, "c" ].compact! == ["a", "b", "c"] and
 [ "a", "b", "c" ].compact!.nil?
end

assert("Array#compact") do
 [ "a", nil, "b", nil, "c" ].compact == ["a", "b", "c"] and
 [ "a", "b", "c" ].compact == [ "a", "b", "c" ] 
end

assert("Array#select!") do
 [ "a", "b", "c" ].select! {|e| e < "c"} == [ "a", "b" ]  and
 [ "a", "b", "c" ].select! {|e| e > "c"} == [] and 
 [ "a", "b", "c" ].select! {|e| e < "d"}.nil?
end

assert("Array#keep_if") do
  ["a", "b", "c"].keep_if {|e| e < "b" }  == ["a"] and
  ["a", "b", "c"].keep_if {|e| e == "d" } == []    and
  ["a", "b", "c"].keep_if {|e| e < "d" }  == ["a", "b", "c"]
end
