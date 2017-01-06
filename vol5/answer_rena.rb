#!/usr/bin/env ruby
# https://paiza.jp/poh/enshura

file = $stdin
lines = file.readlines
file.close

x, y, n = lines[0].split.map{|a| a.to_i}
t = lines[1, y].map{|b| b.split.map{|a| a.to_i}}
rects = lines[y + 1, n].map{|b| b.split.map{|a| a.to_i}}
  
sum = 0

for rect in rects
  for pos_y in (rect[1] - 1)..(rect[3] - 1)
    for pos_x in (rect[0] - 1)..(rect[2] - 1)
      sum += t[pos_y][pos_x]
      t[pos_y][pos_x] = 0
    end
  end
end

puts sum
