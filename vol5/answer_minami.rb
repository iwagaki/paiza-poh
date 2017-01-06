#!/usr/bin/env ruby
# https://paiza.jp/poh/enshura

file = $stdin
lines = file.readlines
file.close

x, y = lines[0].split.map{|a| a.to_i}
t = lines[1, y].map{|b| b.split.map{|a| a.to_i}}

count_list = []
  
for i in 0..x - 1
  count = 0
  for j in 0..y - 1
    count += 1 if t[j][i] == 1
  end
  count_list += [count]
end

for j in 0..y - 1
  line = ""
  for i in 0..x - 1
    c = count_list[i] > y - 1 - j ? 1 : 0
    line += c.to_s + " "
  end
  puts line.rstrip
end
