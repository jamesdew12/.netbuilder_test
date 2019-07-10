puts "hello"

parents = {}


ht = Hash.new {|h,k| h[k]=[]}
ht["john"] << "mum"
ht["john"] << "dad"
ht["gfd"] << "Da"

puts ht
puts "heeLLo".downcase
