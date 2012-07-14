class Entity < GameObject
	include Physics::Movement
	
	def initialize(window)
		shape = Physics::Shape::Rect.new	CP::Body.new(20, CP::INFINITY), 
											50, 100
		
		super(window, shape)
	end
	
	def update
		
	end
	
	def draw
		color = Gosu::Color::BLUE
		z = 0
		
		# Stored coordinate is the bottom left, but the draw coordinate is the top right
		
		x = 0
		y = @window.height - @shape.height
		
		@window.draw_quad	x, y, color,
							x + @shape.width, y, color,
							x + @shape.width, y + @shape.height, color,
							x, y + @shape.height, color
		
	end
end
