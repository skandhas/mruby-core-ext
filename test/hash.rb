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
