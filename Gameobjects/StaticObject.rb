class StaticObject < GameObject
	def initialize(window, shape)
		super(window, shape)
		
		@shape.collision_type = :static
	end
	
	def update
		
	end
	
	def draw
		
	end
end
