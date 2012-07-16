class PlayerAnimation < Animation
	attr_accessor :state
	
	def initialize(window, gameobject)
		
		super(window, gameobject, "./Sprites/Animation Roughs/Sheet.png")
		
		@actions = {
			:idle => [@frames[20]],
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
				@frames[8],
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
		@current_frame = @actions[@state][0].image
	end
	
	def update
		move_threshold = 0.01
		
		case @state
			when :idle
				if @gameobject.body.v.y > move_threshold
					@state = :jump
				elsif @gameobject.body.v.x > move_threshold && @gameobject.body.v.x < -move_threshold
					@state = :run
				end
			when :run
				
			when :jump
				
		end
		
		@current_frame = @actions[@state][0].image
	end
	
	private
	
	def set_frame_timings
		@actions[:attack][:diagonal_down][0].time = 0
		@actions[:attack][:diagonal_down][1].time = 0
	end
end
