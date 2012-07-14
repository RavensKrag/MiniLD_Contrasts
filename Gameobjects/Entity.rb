class Entity < GameObject
	include Physics::Movement
	
	def initialize(window, width, height, mass)
		shape = Physics::Shape::Rect.new	CP::Body.new(mass, CP::INFINITY), 
											width, height
		
		super(window, shape)
		
		@@collision_box_color = Gosu::Color.argb(100, 255,0,0)
	end
	
	def update
		
	end
	
	def draw
		x = @body.p.x.to_px
		y = @window.height - @body.p.y.to_px - @shape.height.to_px
		
		
		@window.draw_quad	x,y,	@@collision_box_color,
							x+@shape.width.to_px,y,	@@collision_box_color,
							x+@shape.width.to_px,y+@shape.height.to_px,	@@collision_box_color,
							x,y+@shape.height.to_px,	@@collision_box_color
	end
end
