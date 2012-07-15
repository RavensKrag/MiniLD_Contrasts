class GameInput < InputHandler
	def initialize(player, jukebox)
		super()
		@player = player
		@jukebox = jukebox
		
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
		
		
		
		new_action :next_sound, :rising_edge do
			@jukebox.next_sound
		end
		
		new_action :next_music, :rising_edge do
			@jukebox.next_music
		end
		
		new_action :play_sound, :rising_edge do
			@jukebox.play_sound
		end
		
		new_action :play_music, :rising_edge do
			@jukebox.play_music
		end
	end
	
	def bind_gameplay_inputs
		self.mode = :gameplay
		
		bind_action :move_left, Gosu::KbLeft
		bind_action :move_right, Gosu::KbRight
		
		bind_action :jump, Gosu::KbSpace
		
		
		bind_action :next_sound, Gosu::KbN
		bind_action :next_music, Gosu::KbM
		
		bind_action :play_sound, Gosu::KbInsert
		bind_action :play_music, Gosu::KbDelete
		
		
		#~ @window.char_to_button_id("f")
	end
end
