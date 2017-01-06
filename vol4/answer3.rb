#!/usr/bin/env ruby
# https://paiza.jp/poh/enkoi

file = $stdin
lines = file.readlines
file.close

t, n = lines[0].split.map{|x| x.to_i}
m_list = lines[1, n].map{|x| x.to_i}

max_sum = sum = m_list[0, t].inject(0){|sum, x| sum + x}

for i in t..n - 1
  sum += -m_list[i - t] + m_list[i]
  max_sum = [max_sum, sum].max
end
  
puts max_sum
