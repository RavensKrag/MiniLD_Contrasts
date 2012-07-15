class LevelState
	def initialize(window, file)
		level = ImageRuby::Image.from_file(file)
		#~ p image.methods
		#~ 
		#~ p image.width
		tiles = Gosu::Image::load_tiles(window, "./Sprites/Rocks.png", -4, -4, true)
		
		black = ImageRuby::Color.from_rgb(0,0,0)
		white = ImageRuby::Color.from_rgb(255,255,255)
		red = ImageRuby::Color.from_rgb(255,0,0)
		
		val = nil
		level.height.times do |y|
			level.width.times do |x|
				val = level.get_pixel x, y
				
				if val == black
					# Examine pixels around black pixels
					check = 0
					
					#~ puts "#{x}, #{y}"
					
					if y > 0 && level.get_pixel(x,y-1) 
						# Top
						check += 1
					end
					
					if x < level.width-1 && level.get_pixel(x+1,y)
						# Right
						check += 2
					end
					
					if y < level.height-1 && level.get_pixel(x,y+1)
						# Bottom
						check += 4
					end
					
					if x > 0 && level.get_pixel(x-1,y)
						# Left
						check += 8
					end
					
					
					
				else
					if val == red
						puts "red"
					end
				end
			end
		end
	end
	
	def update
		
	end
	
	def draw
		
	end
	
	def add_player
		
	end
end
