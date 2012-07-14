class GameInput < InputHandler
	def initialize(player)
		super()
		@player = player
		
		init_gameplay_inputs
		bind_gameplay_inputs
		
		self.mode = :gameplay
	end
	
	def update
		super()
	end
	
	def init_gameplay_inputs
		self.mode = :gameplay
		
		[:move_left, :move_right].each do |action|
			new_action action, :active do
				@player.send action
			end
		end
		
		new_action :jump, :rising_edge do
			@player.jump
		end
	end
	
	def bind_gameplay_inputs
		self.mode = :gameplay
		
		bind_action :move_left, Gosu::KbLeft
		bind_action :move_right, Gosu::KbRight
		
		bind_action :jump, Gosu::KbSpace
		
		#~ @window.char_to_button_id("f")
	end
end
