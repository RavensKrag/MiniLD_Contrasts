class LevelState
	def initialize(window, file)
		level = ImageRuby::Image.from_file(file)
		#~ p image.methods
		#~ 
		#~ p image.width
		
		@static_objects = []
		
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
					
					surfaces = [
						Surface1, Surface2, Surface3, Surface4, 
						Surface5, Surface6, Surface7, Surface8,
						Surface9, Surface10, Surface11, Surface12,
						Surface13, Surface14, Surface15, Surface16
					]
					
					@static_objects << surfaces[check].new(window, x, level.height-y)
				else
					if val == red
						puts "red"
						@spawn = [x, level.height-y]
					end
				end
			end
		end
	end
	
	def update
		
	end
	
	def draw
		@static_objects.each do |obj|
			obj.draw
		end
	end
	
	def add_player(player)
		player.body.p.x = @spawn[0]*256.to_meters
		player.body.p.y = @spawn[1]*256.to_meters
	end
	
	def add_objects_to(space)
		@static_objects.each do |obj|
			obj.add_to space
		end
	end
end
