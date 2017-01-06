#!/usr/bin/env ruby
# https://paiza.jp/poh/enshura

file = $stdin
lines = file.readlines
file.close

n = lines[0].to_i
s = lines[1, n].map{|x| x.to_i}

sum = Array.new(7, 0)

s.each_with_index.map{|si, index| sum[index % 7] += si}
sum.map{|val| puts val}
