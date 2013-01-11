assert("String::try_convert") do
  String.try_convert("str") == "str" and
  String.try_convert(123).nil?
end


