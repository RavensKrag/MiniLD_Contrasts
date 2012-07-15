# Control sounds for the game
class Jukebox
	attr_accessor :music_index, :sound_index
	
	def initialize(window)
		@window = window
		
		@music_index = 0
		@sound_index = 0
		
		@music = [
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_02.ogg")
		]
		
		@sounds = [
			Gosu::Sample.new(@window, "./Music/Effects/concrete_jump_land_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_jump_land_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_jump_land_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_slide_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_slide_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_04.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_05.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_04.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_05.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/projectile_block_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/projectile_block_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/projectile_block_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_04.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_05.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_06.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_07.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_08.ogg")
		]
			
		@volumes = {
			:music => [],
			:sounds => []
		}
		
		#~ @music[1].play 1, 1, true
		# volume (0-1), speed, loop
		# @music play_pan(pan = 0, vol = 1, speed = 1, looping = false) 
	end
	
	def next_music
		@music_index += 1
		@music_index = 0 if @music_index >= @music.length
		
		@current_music.stop if @current_music
	end
	
	def next_sound
		@sound_index += 1
		@sound_index = 0 if @sound_index >= @sounds.length
	end
	
	def play_music
		volume = @volumes[:music][@music_index]
		unless volume
			default_volume = 1.0
			@volumes[:music][@music_index] = default_volume
			volume = default_volume
		end
		
		@current_music = @music[@music_index].play volume
	end
	
	def play_sound
		volume = @volumes[:sounds][@sound_index]
		unless volume
			default_volume = 1.0
			@volumes[:sounds][@sound_index] = default_volume
			volume = default_volume
		end
		
		@current_sound = @sounds[@sound_index].play volume
	end
end
