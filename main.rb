require_relative 'get_file'
require_relative 'get_pos_square'

def	put_square_in_map(map, pos, nb_col)
	n = 0
	while n < pos['size']
		i = 0
		while i < n + 1
			map[(pos['x'] - n) + (nb_col + 1) * (pos['y'] - n)] = "x"
			map[(pos['x'] - n) + i + (nb_col + 1) * (pos['y'] - n)] = "x"
			map[(pos['x'] - n) + (nb_col + 1) * ((pos['y'] - n) + i)] = "x"
			i += 1
		end
		n += 1
	end
end

if ARGV.length != 1
	puts "Enter the name of the map"
	return
end
#path = gets.chomp
nb_col = [0]
file = get_file(ARGV[0], nb_col)
if file == nil
	return 0
end
pos = get_pos_square(file, nb_col[0])
put_square_in_map(file, pos, nb_col[0])
puts file
