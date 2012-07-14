class Platform < StaticObject
	def initialize(window, width, height)
		shape = Physics::Shape::Rect.new CP::Body.new_static, width, height
		
		super(window, shape)
	end
	
	def update
		
	end
	
	def draw
		color = Gosu::Color::RED
		z = 0
		
		# Stored coordinate is the bottom left, but the draw coordinate is the top right
		
		x = 0
		y = -@shape.height
		
		@window.draw_quad	x, y, color,
							x + @shape.width, y, color,
							x + @shape.width, y + @shape.height, color,
							x, y + @shape.height, color
	end
end
