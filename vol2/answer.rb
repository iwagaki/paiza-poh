#!/usr/bin/env ruby
# https://paiza.jp/poh/paizen

file = $stdin
lines = file.readlines
file.close

H, W = lines[0].split.map{|x| x.to_i}
screen = lines[1, H].map{|x| x.strip}.join
N = lines[H + 1].to_i
widgets = lines[H + 2, N].each_with_index.map{|x, i| x.split.map{|y| y.to_i} + [i]}

sorted_widgets = {}
for widget_h, widget_w, index in widgets
  if not sorted_widgets.has_key?(widget_h)
    sorted_widgets[widget_h] = []
  end
  sorted_widgets[widget_h] += [[widget_h, widget_w, index]]
end

count_map = Array.new(W * H, 0)
results = Array.new(N, 0)

(0..H - 1).reverse_each do |y|
  (0..W - 1).reverse_each do |x|
    pos = y * W + x
    sign = count_map[pos] = screen[pos] == "0" ? +1 : -1
    if x < W - 1 and count_map[pos + 1] * sign > 0
      count_map[pos] += count_map[pos + 1]
    end
  end
end

def get_left_most(x, y, n, count_map)
  while x < W
    left_min = (0..n - 1).map{|i| count_map[(y + i) * W + x]}.min
    if left_min > 0
      return x, left_min
    end
    x += -left_min
  end
  return x, 0
end

sorted_widgets.each{|widget_h, values|
  for y in 0..H - widget_h
    x = 0
    while x < W
      new_x, width = get_left_most(x, y, widget_h, count_map)
      if new_x == W
        break
      end
      for widget_h, widget_w, i in values
        if width >= widget_w
          results[i] += width - widget_w + 1
        end
      end
        x = new_x + width
    end
  end
}

puts results
