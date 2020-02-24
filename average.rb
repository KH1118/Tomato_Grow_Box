data = IO.readlines("growtent_co2.data.20200206")
x,y1,y2 = [],[],[]
data[2..-1].each do |d|
	e,f,g = d.split(",")
	p = e.chomp
	6.times {p.chop!}
	p=p.split.join('T')
	x << p
	y1 << f.chomp.chop.chop.chop.strip.to_f
	y2 << g.chomp.chop.chop.chop.strip.to_f
end	

 puts y1.inject(:+)/y1.length,y2.inject(:+)/y2.length 


