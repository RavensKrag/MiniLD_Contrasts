class Platform < StaticObject
	def initialize(window, width, height)
		shape = Physics::Shape::Rect.new self, CP::Body.new_static, width, height
		
		super(window, shape)
		
		@shape.u = 0.8
	end
	
	def update
		
	end
	
	def draw
		color = Gosu::Color::RED
		z = 0
		
		# Stored coordinate is the bottom left, but the draw coordinate is the top right
		
		x = 0
		y = @window.height - @body.p.y.to_px - @shape.height
		
		@window.draw_quad	x, y, color,
							x + @shape.width.to_px, y, color,
							x + @shape.width.to_px, y - @shape.height.to_px, color,
							x, y - @shape.height.to_px, color
	end
end
