class Animation
	Frame = Struct.new(:image, :time)
	
	def initialize(window, gameobject, spritesheet_file, x_offset=0, y_offset=0)
		@window = window
		@gameobject = gameobject
		@x_offset = x_offset
		@y_offset = y_offset
		
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
		args[0] += @x_offset if args[0]
		args[1] += @y_offset if args[1]
		@current_frame.draw *args
	end
	
	def draw_rot(*args)
		args[0] += @x_offset if args[0]
		args[1] += @y_offset if args[1]
		@current_frame.draw_rot *args
	end
	
	def width
		@frames[0].image.width
	end
	
	def height
		@frames[0].image.height
	end
end
