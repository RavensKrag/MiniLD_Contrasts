class PlayerAnimation < Animation
	def initialize(window)
		
		super(window, "./Sprites/Animation Roughs/Sheet.png")
		
		@actions = {
			:idle => [@frames[20]],
			:attack => {
				:diagonal_down => [
					@frames[0], @frames[1]
				],
				:diagonal_up => [
					@frames[0], @frames[1]
				],
				:horizontal => [
					@frames[0], @frames[1]
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
		
		@current_frame = @actions[:idle][0]
	end
	
	def update
		
	end
end
