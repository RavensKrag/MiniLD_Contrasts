# Control sounds for the game
class Jukebox
	def initialize(window)
		@window = window
		
		@music = [
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_02.ogg")
		]
		
		@music[1].play 1, 1, true
	end
end
