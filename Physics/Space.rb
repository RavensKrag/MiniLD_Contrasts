
module Physics
	class Space < CP::Space
		def initialize(dt)
			@dt = dt
			
			super()
			
			self.iterations = 10
			#~ self.damping = 0.2
			
			@entities = []
			
			self.gravity = CP::Vec2.new(0,-60)
			
			self.add_collision_handler :entity, :static, Collisions::EntityStatic.new
		end
		
		def step
			super(@dt)
			
			@entities.each do |entity|
				entity.body.reset_forces
			end
		end
		
		def add_gameobject(obj)
			if obj.static?
				self.add_static_shape obj.shape
				#~ self.add_static_body
			else
				@entities << obj
				self.add_shape obj.shape
				self.add_body obj.body
			end
		end
	end
end
