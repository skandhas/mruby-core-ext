assert("Integer#denominator") do
  100.denominator == 1
end

assert("Integer#integer?") do
  100.integer? 
end

assert("Integer#numerator") do
  i = 100
  i.numerator.equal? i
end
