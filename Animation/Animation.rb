class Animation
	def initialize(window, spritesheet_file)
		@window = window
		@frames = Gosu::Image.load_tiles window, spritesheet_file,	-6, -6, false
		
		@current_frame = @frames[20]
	end
	
	def update
		
	end
	
	def draw(*args)
		@current_frame.draw *args
	end
	
	def draw_rot(*args)
		@current_frame.draw_rot *args
	end
	
	def width
		@frames[0].width
	end
	
	def height
		@frames[0].height
	end
end
