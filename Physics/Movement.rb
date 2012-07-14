module Physics
	module Movement
		def init_movement(move_constant)
			@move_constant = move_constant
		end
		
		def move_right
			@body.apply_force CP::Vec2.new(50000, 0), CP::ZERO_VEC_2
		end
		
		def move_left
			@body.apply_force CP::Vec2.new(-50000, 0), CP::ZERO_VEC_2
		end
		
		def jump
			@body.apply_force CP::Vec2.new(0, 200), CP::ZERO_VEC_2
		end
	end
end
