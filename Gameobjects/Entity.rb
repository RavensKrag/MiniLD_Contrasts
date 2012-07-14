class Entity < GameObject
	include Physics::Movement
	
	def initialize(window, width, height, mass)
		shape = Physics::Shape::Rect.new	CP::Body.new(mass, CP::INFINITY), 
											width, height
		
		super(window, shape)
	end
	
	def update
		
	end
	
	def draw
		color = Gosu::Color::BLUE
		z = 0
		
		# Stored coordinate is the bottom left, but the draw coordinate is the top right
		
		x = @body.p.x.to_px
		y = @window.height - @body.p.y.to_px
		
		puts "x,y : #{x}, #{y}"
		
		#~ @window.draw_quad	x, y, color,
							#~ x + @shape.width.to_px, y, color,
							#~ x + @shape.width.to_px, y - @shape.height.to_px, color,
							#~ x, y - @shape.height.to_px, color, -200
		
		#~ x = 0
		#~ y = @window.height
		#~ # Draws white box at the origin
		#~ @window.draw_quad	x,		y, Gosu::Color::WHITE,
							#~ x+100,	y, Gosu::Color::WHITE,
							#~ x+100,	y-100, Gosu::Color::WHITE,
							#~ x,		y-100, Gosu::Color::WHITE
		
	end
end
