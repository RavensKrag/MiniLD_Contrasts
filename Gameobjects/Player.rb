class Player < Entity
	def initialize(window)
		@img = Gosu::Image.new window, "./Sprites/Character-Idle-Prototype.png", false
		
		super(window, @img.width.to_meters, @img.height.to_meters, 54)
		
		@body.p.y = 30
	end
	
	def update
		super()
	end
	
	def draw
		x = @body.p.x.to_px
		y = @window.height - @body.p.y.to_px - @shape.height.to_px
		
		
		@img.draw	x,	y, 100
		
		super() # Draw debug shape for collision body
	end
end
