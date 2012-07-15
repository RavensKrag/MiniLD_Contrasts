module Physics
	module Movement
		def init_movement(move_constant)
			@move_constant = move_constant
			@jump_count = 0
			@max_jump_count = 200000000000
		end
		
		def move_right
			@body.apply_force CP::Vec2.new(@move_constant, 0), CP::ZERO_VEC_2
			# TODO: Try applying impulse instead
		end
		
		def move_left
			@body.apply_force CP::Vec2.new(-@move_constant, 0), CP::ZERO_VEC_2
		end
		
		def jump
			if @jump_count < @max_jump_count
				@jump_count += 1
				@body.v.y = 20
			end
		end
		
		def reset_jump
			@jump_count = 0
		end
	end
end
