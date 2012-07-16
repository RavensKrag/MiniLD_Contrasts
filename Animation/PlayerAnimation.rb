class PlayerAnimation < Animation
	attr_accessor :state
	
	def initialize(window, gameobject)
		
		super(window, gameobject, "./Sprites/Animation Roughs/Sheet.png")
		
		@actions = {
			:idle => [
				@frames[20]
			],
			:attack => {
				:diagonal_down => [
					@frames[0], @frames[1]
				],
				:diagonal_up => [
					@frames[2], @frames[3]
				],
				:horizontal => [
					@frames[4], @frames[5]
				],
				:vertical_down => [
					@frames[18], @frames[19]
				],
				:vertical_up => [
					@frames[21], @frames[22]
				]
			},
			
			:jump => [
				@frames[6],
				@frames[7],
				@frames[8]
			],
			
			:jump_to_idle => [
				@frames[9]
			],
			
			:run => [
				@frames[10],
				@frames[11],
				@frames[12],
				@frames[13],
				@frames[14],
				@frames[15],
				@frames[16],
				@frames[17]
			],
		}
		
		set_frame_timings
		
		@state = :idle
		@i = 0
		@current_frame = @actions[@state][@i].image
		@time = Gosu.milliseconds
	end
	
	def update
		move_threshold = 0.01
		
		case @state
			when :idle
				@i = 0
				if @gameobject.body.v.x > move_threshold || @gameobject.body.v.x < -move_threshold
					@state = :run
				end
				
				if @gameobject.body.v.y > move_threshold
					@state = :jump
				end
				
				
			when :run
				if @gameobject.body.v.x.abs < move_threshold
					@state = :idle
					@i = 0
					return
				elsif @gameobject.body.v.y.abs > move_threshold
					@state = :jump
					@i = 0
					return
				end
				
				if dt > frame_time
					@i += 1
					timestamp
					
					if @i == @actions[:run].length # Loop animation
						@i = 0
					end
				end
			when :jump
				if @gameobject.body.v.y.abs < 3
					@i = 1
				else
					if @gameobject.body.v.y > 0
						@i = 0
					else
						@i = 2
					end
				end
			when :jump_to_idle
				#~ Should be able to cancel into any other animation state
				# TODO: Make less BAD
				# Cancel out
				
				if @gameobject.body.v.y > move_threshold
					@state = :jump
					@i = 0
				end
				
				if @gameobject.body.v.x > move_threshold || @gameobject.body.v.x < -move_threshold
					@state = :run
					@i = 0
				end
				
				# For this state
				if dt > frame_time
					@state = :idle
				end
		end
		
		
		@current_frame = @actions[@state][@i].image
	end
	
	def transition_to(next_state)
		case next_state
			when :idle
				if @state == :jump
					@state = :jump_to_idle
					@i = 0
					timestamp
				end
			else
				@state = next_state
		end
	end
	
	private
	
	def timestamp
		@time = Gosu.milliseconds
	end
	
	def dt
		return Gosu.milliseconds - @time
	end
	
	def frame_time
		@actions[@state][@i].time
	end
	
	def set_frame_timings
		@actions[:attack][:diagonal_down][0].time = 0
		@actions[:attack][:diagonal_down][1].time = 0
		
		@actions[:run][0].time = 70
		@actions[:run][1].time = 70
		@actions[:run][2].time = 70
		@actions[:run][3].time = 70
		@actions[:run][4].time = 70
		@actions[:run][5].time = 70
		@actions[:run][6].time = 70
		@actions[:run][7].time = 70
		
		@actions[:jump_to_idle][0].time = 350
	end
end
