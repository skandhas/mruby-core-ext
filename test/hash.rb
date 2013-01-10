assert("Hash#delete_if") do
  h = { "a" => 100, "b" => 200, "c" => 300 }
  h.delete_if {|key, value| key >= "b" } == { "a" => 100 } and
  h.delete_if {|key, value| key >= "e" } == h
end
