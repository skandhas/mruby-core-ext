assert("Symbol#length") do
  :I.length  == 1 and :love.size == 4 and :mruby.length == 5
end

assert("Symbol#capitalize") do
  :hello.capitalize == :Hello and :HELLO.capitalize == :Hello
end


