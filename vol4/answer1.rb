#!/usr/bin/env ruby
# https://paiza.jp/poh/enkoi

file = $stdin
lines = file.readlines
file.close

n = lines[0].to_i
s_list = lines[1, n].map{|x| x.to_i}

puts s_list.inject(0){|sum, x| sum + x}
