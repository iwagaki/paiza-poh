#!/usr/bin/env ruby
# https://paiza.jp/poh/enkoi

file = $stdin
lines = file.readlines
file.close

n = lines[0].to_i
tsp_list = lines[1, n].map{|x| x.split.map{|y| y.to_i}}

sum = 0
for t_i, s_i, p_i in tsp_list
  if s_i < t_i
    sum += (t_i - s_i) * p_i
  end
end

puts sum
