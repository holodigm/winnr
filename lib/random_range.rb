
def rand_int(from, to)
	rand_in_range(from, to).to_i
end

def rand_price(from, to)
	rand_in_range(from, to).round(2)
end

def rand_time(from, to)
	Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
	rand * (to - from) + from
end

