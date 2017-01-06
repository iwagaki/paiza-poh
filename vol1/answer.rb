#!/usr/bin/env ruby
# https://paiza.jp/poh/ec-campaign

file = $stdin
lines = file.readlines
file.close

N, D = lines[0].split.map{|x| x.to_i}
p = lines[1, N].map{|x| x.to_i}
m = lines[N + 1, D].map{|x| x.to_i}

p.sort!

def calc(th, p)
  i = 0
  j = p.length - 1
  max_total = 0
  while i < j
    total = p[i] + p[j]
    if total == th
      return total
    elsif total < th
      max_total = [max_total, total].max
      i += 1
    elsif total > th
      j -= 1
    end
  end
  return max_total
end

results = []

for th in m
  p_selected = p.select {|x| x <= th - p.first}
  results += [calc(th, p_selected)]
end

puts results
