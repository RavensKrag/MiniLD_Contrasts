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
		@window.draw_quad	@body.p.x, @body.p.y, color,
							@body.p.x + @shape.width, @body.p.y, color,
							@body.p.x + @shape.width, @body.p.y + @shape.height, color,
							@body.p.x, @body.p.y + @shape.height, color, z
	end
end
