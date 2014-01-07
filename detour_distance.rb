EARTH_RADIUS_MILES = 3959

puts "please enter starting lat/long coordinates for point 'a' separated by a comma i.e. lat, long"
a_coord = gets

puts "please enter starting lat/long coordinates for point 'b' separated by a comma i.e. lat, long"
b_coord = gets

puts "please enter starting lat/long coordinates for point 'c' separated by a comma i.e. lat, long"
c_coord = gets

puts "please enter starting lat/long coordinates for point 'd' separated by a comma i.e. lat, long"
d_coord = gets

#calculated using haversine formula http://en.wikipedia.org/wiki/Haversine_formula
def dist_between(lat_one, long_one, lat_two, long_two)
	dist_lat = (lat_one - lat_two) * Math::PI / 180
	dist_long = (long_one - long_two) * Math::PI / 180
	lat_one = lat_one * Math::PI / 180
	lat_two = lat_two * Math::PI / 180
	a = Math::sin(dist_lat/2) ** 2 + (Math.sin(dist_long) ** 2) * Math::cos(lat_one) * Math::cos(lat_two) 
	c = 2 * Math::atan2(Math.sqrt(a), Math.sqrt(1-a))
	return EARTH_RADIUS_MILES * c
end

a_lat = a_coord.split(',').first.strip.to_f
a_long = a_coord.split(',').last.strip.to_f
b_lat = b_coord.split(',').first.strip.to_f
b_long = b_coord.split(',').last.strip.to_f
c_lat = c_coord.split(',').first.strip.to_f
c_long = c_coord.split(',').last.strip.to_f
d_lat = d_coord.split(',').first.strip.to_f
d_long = d_coord.split(',').last.strip.to_f

detour_dist = (dist_between(a_lat, a_long, c_lat, c_long) + dist_between(b_lat, b_long, d_lat, d_long) + [dist_between(a_lat, a_long, b_lat, b_long), dist_between(c_lat, c_long, d_lat, d_long)].min)

puts "detour distance for the two riders is #{detour_dist} miles"
