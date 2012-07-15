class DebugOutput
	def initialize(window)
		@window = window
	end
	
	def update
		
	end
	
	def draw
		origin_box
		player_info
		camera_info
		
		music_info
		sound_info
	end
	
	private
	
	def origin_box
		# Draws white box at the origin
		x = 0
		y = @window.height
		
		@window.draw_quad	x,		y, Gosu::Color::WHITE,
							x+100,	y, Gosu::Color::WHITE,
							x+100,	y-100, Gosu::Color::WHITE,
							x+0,	y-100, Gosu::Color::WHITE
	end
	
	def debug_print(heading, content, x=0,y=0, options={})
		options = {
			:color => Gosu::Color::WHITE, 
			:indent => 30
		}.merge! options
		
		@window.translate x,y do
			@window.font.draw	heading, 
								0, @window.font.height*0, 0,
								1,1, options[:color]
			
			content.each_with_index do |line, i|
				@window.font.draw	line,
									options[:indent], @window.font.height*(i+1), 0,
									1,1, options[:color]
			end
		end
	end
	
	def player_info
		format = "%.3f"
		
		debug_print "Player", [
			"px, py : #{format % @window.player.body.p.x}, #{format % @window.player.body.p.y}",
			"vx, vy : #{format % @window.player.body.v.x}, #{format % @window.player.body.v.y}",
			"fx, fy : #{format % @window.player.body.f.x}, #{format % @window.player.body.f.y}"
		], 0,100
	end
	
	def camera_info
		format = "%.3f"
		
		debug_print "Camera", [
			"zoom: #{format % @window.zoom}"
		], 0,0
	end
	
	def music_info
		format = "%.3f"
		
		debug_print	"Music", [
			"index: #{format % @window.jukebox.music_index}",
			"volume: #{format % @window.jukebox.current_music_volume}"
		], 200,0
	end
	
	def sound_info
		format = "%.3f"
		
		debug_print	"Sound", [
			"index: #{format % @window.jukebox.sound_index}",
			"volume: #{format % @window.jukebox.current_sound_volume}"
		], 350,0
	end
end
