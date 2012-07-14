
module Physics
	class Space < CP::Space
		def initialize(dt)
			@dt = dt
			
			super()
			
			self.iterations = 10
			#~ self.damping = 0.2
		end
		
		def step
			super(@dt)
		end
		
		def add_gameobject(obj)
			if obj.static?
				self.add_static_shape obj.shape
				#~ self.add_static_body
			else
				self.add_shape obj.shape
				self.add_body obj.body
			end
		end
	end
end
