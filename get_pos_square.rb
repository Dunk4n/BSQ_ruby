def one_line_is_good(map, x, y, n, nb_col)
	i = 0
	while i < n
		if map[x + i + y * (nb_col + 1)] == 'o' || map[x + (y + i) * (nb_col + 1)] == 'o'
			return false
		end
		i += 1
	end
	return true
end

def good_square(map, x, y, tmp, nb_col)
	n = 1
	while n < tmp
		if x - n < 0 || y - n < 0 ||
one_line_is_good(map, x - n, y - n, n, nb_col) == false
			return n
		end
		n += 1
	end
	return n
end

def get_pos_square(map, nb_col)
	pos = {'x' => 0, 'y' => 0, 'size' => 0}
	befor = Array.new(nb_col, 0)
	y = 0

	while y * (nb_col + 1) < map.length
		x = 0
		bcol = 0
		while x < nb_col
			tmp = 0
			if map[x + y * (nb_col + 1)] != 'o'
				tmp = ((bcol < befor[x]) ? bcol : befor[x]) + 1
			end
			bcol = tmp
			befor[x] = tmp
			#puts "#{map[x + y * (nb_col + 1)]} x = #{x} y = #{y}, size = #{pos['size']}"
			tmp = good_square(map, x, y, tmp, nb_col) if tmp > pos['size']
			if tmp > pos['size']
				pos['x'] = x
				pos['y'] = y
				pos['size'] = tmp
			end
			x += 1
		end
		y += 1
	end
	return pos
end
