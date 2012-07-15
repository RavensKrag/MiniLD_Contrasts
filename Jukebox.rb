# Control sounds for the game
class Jukebox
	def initialize(window)
		@window = window
		
		@music = [
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_02.ogg")
		]
		
		@sounds = [
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_jump_land_01.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_jump_land_02.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_jump_land_03.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_slide_01.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_slide_02.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_step_01.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_step_02.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_step_03.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_step_04.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/concrete_step_05.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/grass_step_01.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/grass_step_02.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/grass_step_03.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/grass_step_04.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/grass_step_05.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/projectile_block_01.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/projectile_block_02.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/projectile_block_03.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/sword_swing_01.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/sword_swing_02.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/sword_swing_03.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/sword_swing_04.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/sword_swing_05.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/sword_swing_06.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/sword_swing_07.ogg"),
			Gosu::Sample.new(@windows, "./Music/Effects/sword_swing_08.ogg")
		]
			
		
		
		@music[1].play 1, 1, true
		# volume (0-1), speed, loop
		# @music play_pan(pan = 0, vol = 1, speed = 1, looping = false) 
	end
end
