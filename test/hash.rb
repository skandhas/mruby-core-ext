assert("Hash::try_convert") do
 Hash.try_convert({1=>2}) == {1=>2} and
 Hash.try_convert("1=>2").nil?
end

assert("Hash#assoc") do
  h = {"colors"  => ["red", "blue", "green"],
       "letters" => ["a", "b", "c" ]}

  h.assoc("letters") == ["letters", ["a", "b", "c"]] and
  h.assoc("foo").nil?
end

#assert("Hash#rassoc") do
#  a = {1=> "one", 2 => "two", 3 => "three", "ii" => "two"}
#  a.rassoc("two") == [2, "two"] and  a.rassoc("four").nil?
#end

assert("Hash#delete_if") do
  h = { "a" => 100, "b" => 200, "c" => 300 }
  h.delete_if {|key, value| key >= "b" } == { "a" => 100 } and
  h.delete_if {|key, value| key == "e" } == { "a" => 100 }
end

assert("Hash#keep_if") do
  h = { "a" => 100, "b" => 200, "c" => 300 }
  h.dup.keep_if {|key, value| key < "b" } == { "a" => 100 } and
  h.dup.keep_if {|key, value| key == "d" } == {} and
  h.dup.keep_if {|key, value| key < "d" } == h
end
