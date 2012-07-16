module Physics
	module Movement
		attr_accessor :airborne
		
		def init_movement(move_constant, air_move_constant)
			@ground_move_constant = move_constant
			@air_move_constant = air_move_constant
			
			@jump_count = 0
			@max_jump_count = 200000000000
			
			@airborne = false
		end
		
		def move_right
			constant = if @airborne
				@air_move_constant
			else
				@ground_move_constant
			end
			
			@body.apply_force CP::Vec2.new(constant, 0), CP::ZERO_VEC_2
			# TODO: Try applying impulse instead
		end
		
		def move_left
			constant = if @airborne
				@air_move_constant
			else
				@ground_move_constant
			end
			
			@body.apply_force CP::Vec2.new(-constant, 0), CP::ZERO_VEC_2
		end
		
		def jump
			if @jump_count < @max_jump_count
				@jump_count += 1
				@body.v.y = 20
				
				@airborne = true
			end
		end
		
		def reset_jump
			@airborne = false
			@jump_count = 0
		end
	end
end
