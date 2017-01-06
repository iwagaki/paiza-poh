#!/usr/bin/env ruby
# https://paiza.jp/poh/kirishima

file = $stdin
lines = file.readlines
file.close

m = lines[0].to_i
n = lines[1].to_i
companies = lines[2, n].map{|x| x.split.map{|y| y.to_i}}
companies.sort!{|a, b| b[0] <=> a[0]}

map_q_to_r = {}
map_q_to_r[0] = 0

left_q_sum = companies.inject(0){|sum, x| sum + x[0]}

for q,r in companies
  new_map_q_to_r = {}
  for sq, sr in map_q_to_r
    next if sq + left_q_sum < m
    new_map_q_to_r[sq] = sr
  end
  for sq, sr in map_q_to_r
    if new_map_q_to_r.has_key?(sq + q)
      new_map_q_to_r[sq + q] = [map_q_to_r[sq + q], sr + r].min
    else
      new_map_q_to_r[sq + q] = sr + r
    end
  end
  map_q_to_r = new_map_q_to_r
  left_q_sum -= q
end

min_cost = -1
for sq, sr in map_q_to_r
  if sq >= m
    if min_cost < 0
      min_cost = sr
    else
      min_cost = [min_cost, sr].min
    end
  end
end

puts min_cost
