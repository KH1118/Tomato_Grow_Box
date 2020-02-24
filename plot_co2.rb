require "gnuplot"

data = IO.readlines("growtent_co2.data")
x, y1, y2 = [],[],[]
data[2..-1].each do |d|
  e,f,g = d.split(",")
  p = e.chomp
  6.times {p.chop!}
  p=p.split.join('T')
  x << p
  y1 << f.chomp.chop.chop.chop.strip.to_f
  y2 << g.chomp.chop.chop.chop.strip.to_f
end

#362


Gnuplot.open() do |gp|
    Gnuplot::Plot.new( gp ) do |plot|
    	plot.ylabel 'CO_2 (ppm) '
    	plot.xlabel "Time (starting at #{x[0]})"
    	plot.timefmt "'%Y-%m-%dT%H:%M:%S'"
    	plot.xdata "time"
    	plot.format 'x "%d\n%H:%M"'
    	#plot.format "x '%d/%m\n%H:%M'"
    	plot.style "data lines"
    	plot.set 'terminal postscript color eps enhanced font "Helvetica,13" size 16cm,8cm'
    	plot.set "output 'temperature-pcb.ps'"
    	plot.data << Gnuplot::DataSet.new( [x, y1] ) do |ds|
    		ds.with = "linespoints"
    		#ds.linecolor = "black"
    		#ds.linewidth = "3"
    		ds.notitle
    		ds.using = "1:2"
    	end
    	plot.data << Gnuplot::DataSet.new( [x, y2] ) do |ds|
    		ds.with = "linespoints"
    		#ds.linecolor = "black"
    		#ds.linewidth = "3"
    		ds.notitle
    		ds.using = "1:2"
    	end
    end
end
