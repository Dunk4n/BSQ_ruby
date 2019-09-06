class String
	def is_i?
		!!(self =~ /\A[0-9]+\z/)
	end
end

def good_map(str, nb_col, nb_line)
	nb_col[0] = 0
	i = 0
	return false if str[0] == "\n"
	str.each_char do |c|
		if c == "\n"
			if nb_col[0] == 0
				nb_col[0] = i
			elsif (i + 1) % (nb_col[0] + 1) != 0
				return false
			end
		end
		return false if c != 'o' && c != '.' && c != "\n"
		i += 1
	end
	return false if (i + 1) / (nb_col[0] + 1) != nb_line
	return true
end


def get_file(path, nb_col)
	nb = ""
	return nil if File.file?(path) == false
	str = File.read(path)

	str.each_char do |c|
		str.slice!(0)
		if c == "\n"
			break
		end
		nb += c
	end

	if nb.is_i? == false
		return nil
	end
	nb = nb.to_i
	if str[0] == false || nb == 0
		return nil
	end
	if good_map(str, nb_col, nb) == false
		return nil
	end
	return str
end
