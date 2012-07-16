class Player < Entity
	def initialize(window)
		@animation = PlayerAnimation.new window
		
		@scale = 1
		mass = 54
		move_constant = 500
		super(window, (@animation.width/2).to_meters*@scale, @animation.height.to_meters*@scale, 
				mass, move_constant)
		
		@body.p = CP::Vec2.new(1,1)
		
		@shape.u = 0.2
		
		#~ @body.v_limit = 20
		
		# TODO: Update player hitbox
		
		
	end
	
	def update
		super()
		@animation.update
	end
	
	def draw
		x = @body.p.x.to_px
		y = @window.height - @body.p.y.to_px - @shape.height.to_px
		
		dir =	if @body.v.x > 0
					-1
				else
					1
				end
		
		@animation.draw_rot	x,	y, 100, 0, 0.5,0,	dir*@scale,@scale
		#~ @img.draw_rot	x,	y, 100, 0, 0.5,0,	dir,1
		#~ @img.draw_rot	x-@img.width,	y, 100, 0,0.5,0.5,	1,1
		
		super() # Draw debug shape for collision body
	end
end
