class Animation
	Frame = Struct.new(:image, :time)
	
	def initialize(window, gameobject, spritesheet_file)
		@window = window
		@gameobject = gameobject
		
		images = Gosu::Image.load_tiles window, spritesheet_file,	-6, -6, false
		
		@frames = []
		images.length.times do |i|
			@frames << Frame.new(images[i], 0)
		end
		
		@current_frame = @frames[20].image
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
		@frames[0].image.width
	end
	
	def height
		@frames[0].image.height
	end
end
