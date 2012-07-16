class Entity < GameObject
	include Physics::Movement
	
	def initialize(window, width, height, mass, ground_move_constant, air_move_constant)
		shape = Physics::Shape::Rect.new	self, CP::Body.new(mass, CP::INFINITY), 
											width, height, CP::Vec2.new(-width/2.0,0)
		
		super(window, shape)
		@shape.collision_type = :entity
		
		init_movement ground_move_constant, air_move_constant
		
		@@collision_box_color = Gosu::Color.argb(100, 255,0,0)
	end
	
	def update
		
	end
	
	def draw
		x = @body.p.x.to_px - @shape.width.to_px/2
		y = @window.height - @body.p.y.to_px - @shape.height.to_px
		
		
		@window.draw_quad	x,y,	@@collision_box_color,
							x+@shape.width.to_px,y,	@@collision_box_color,
							x+@shape.width.to_px,y+@shape.height.to_px,	@@collision_box_color,
							x,y+@shape.height.to_px,	@@collision_box_color
	end
end
