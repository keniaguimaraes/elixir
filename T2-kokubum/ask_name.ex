name = IO.gets "What's your name? "
baseName = String.upcase(name)
isEqual = String.trim(baseName)=="ERICK"

if isEqual do
  IO.puts "Hey #{String.trim(name)}, congratulations, you have the same name as me! Nice to meet you, we will definitely be friends!"
else
  IO.puts "Hello, #{String.trim(name)}! Nice to meet you!"
end
