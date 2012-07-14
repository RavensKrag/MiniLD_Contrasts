# Control sounds for the game
class Jukebox
	def initialize(window)
		@window = window
		
		@music = [
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_01.ogg")
		]
		
		@music[0].play 1, 1, true
	end
end
