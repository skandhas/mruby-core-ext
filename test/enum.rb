assert("Enumrable#drop") do
  a = [1, 2, 3, 4, 5, 0]
  a.drop(3) == [4, 5, 0] and
  a.drop(6) == [] 
end

assert("Enumrable#each_cons") do
  a = []
  (1..5).each_cons(3){|e| a << e}
  a == [[1, 2, 3], [2, 3, 4], [3, 4, 5]]
end

assert("Enumrable#each_slice") do
  a = []
  (1..10).each_slice(3){|e| a << e}
  a == [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
end

assert("Enumrable#group_by") do
  r = (1..6).group_by {|i| i % 3 }
  r[0] == [3, 6] and
  r[1] == [1, 4] and
  r[2] == [2, 5]
end
