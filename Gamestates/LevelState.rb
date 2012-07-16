class LevelState
	def initialize(window, file)
		@window = window
		load_static_objects(file)
		
		@backdrop = Gosu::Image.new(@window, "./Sprites/Background/Backdrop.png", false)
		
		@mountains1 = Gosu::Image.new(@window, "./Sprites/Background/Mountains-1.png", false)
		@mountains2 = Gosu::Image.new(@window, "./Sprites/Background/Mountains-2.png", false)
		
		@mountain_1_scale_x = 0.01
		@mountain_1_scale_y = 0.00225
		@mountain_1_offset_y = 0
		
		@mountain_2_scale_x = 0.015
		@mountain_2_scale_y = 0.0025
		@mountain_2_offset_y = 0
	end
	
	def update
		@player.update
	end
	
	def draw
		@backdrop.draw 0,0,0
		
		x = -@window.player.body.p.x.to_px
		y = -@window.player.body.p.y.to_px
		
		@mountains1.draw	0+x*@mountain_1_scale_x, 
							@window.height-@mountains1.height+y*@mountain_1_scale_y+@mountain_1_offset_y, 0
		@mountains1.draw	@mountains1.width+x*@mountain_1_scale_x, 
							@window.height-@mountains1.height+y*@mountain_1_scale_y+@mountain_1_offset_y, 0
		@mountains1.draw	-@mountains1.width+x*@mountain_1_scale_x,
							@window.height-@mountains1.height+y*@mountain_1_scale_y+@mountain_1_offset_y, 0
		
		@mountains2.draw	0+x*@mountain_2_scale_x, 
							@window.height-@mountains2.height+y*@mountain_2_scale_y+@mountain_2_offset_y, 0
		@mountains2.draw	@mountains2.width+x*@mountain_2_scale_x, 
							@window.height-@mountains2.height+y*@mountain_2_scale_y+@mountain_2_offset_y, 0
		@mountains2.draw	-@mountains2.width+x*@mountain_2_scale_x,
							@window.height-@mountains2.height+y*@mountain_2_scale_y+@mountain_2_offset_y, 0
		
		@window.translate @window.width/2, -300 do
			@window.scale @window.zoom, @window.zoom, 0,@window.height do
				@window.translate -@player.body.p.x.to_px, @player.body.p.y.to_px do
					@static_objects.each do |obj|
						obj.draw
					end
					
					@player.draw
				end
			end
		end
	end
	
	def add_player(player)
		@player = player
		player.body.p.x = ((@spawn[0]+1)*256).to_meters
		player.body.p.y = ((@spawn[1]+1)*256).to_meters
	end
	
	def add_objects_to(space)
		@static_objects.each do |obj|
			obj.add_to space
		end
	end
	
	private
	
	def load_static_objects(file)
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
					
					if y > 0 && level.get_pixel(x,y-1) == black
						# Top
						check += 1
					end
					
					if x < level.width-1 && level.get_pixel(x+1,y) == black
						# Right
						check += 2
					end
					
					if y < level.height-1 && level.get_pixel(x,y+1) == black
						# Bottom
						check += 4
					end
					
					if x > 0 && level.get_pixel(x-1,y) == black
						# Left
						check += 8
					end
					
					#~ puts check
					
					surfaces = [
						Surface1, Surface2, Surface3, Surface4, 
						Surface5, Surface6, Surface7, Surface8,
						Surface9, Surface10, Surface11, Surface12,
						Surface13, Surface14, Surface15, Surface16
					]
					
					@static_objects << surfaces[check].new(@window, x, level.height-y)
				else
					if val == red
						#~ puts "red"
						@spawn = [x, level.height-y]
					end
				end
			end
		end
	end
end
