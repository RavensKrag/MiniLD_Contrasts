class GameObject
	attr_reader :shape, :body
	
	def initialize(window, shape)
		@window = window
		
		@shape = shape
		@body = shape.body
	end
	
	def update
		
	end
	
	def draw
		
	end
	
	def static?
		return @body.mass == CP::INFINITY
	end
	
	def add_to(space)
		space.add_gameobject self
	end
end
