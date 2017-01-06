#!/usr/bin/env ruby
# https://paiza.jp/poh/enshura

file = $stdin
lines = file.readlines
file.close

s = lines[0].chomp

result = ""
s.split("").each_with_index{|c, index| result += c if index % 2 == 0}
puts result
