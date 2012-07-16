class Platform < StaticObject
	TILE_WIDTH = 1024/4
	TILE_HEIGHT = 1024/4
	
	def initialize(window, index, verts, x,y)
		@index = index
		
		shape = CP::Shape::Poly.new CP::Body.new_static(), verts, CP::ZERO_VEC_2
		super(window, shape)
		
		@shape.u = 0.8
		@body.p.x = x*TILE_WIDTH.to_meters
		@body.p.y = y*TILE_HEIGHT.to_meters
		
		@@spritesheet ||= Gosu::Image::load_tiles(window, "./Sprites/Rocks.png", -4, -4, true)
	end
	
	def update
		
	end
	
	def draw
		color = Gosu::Color.argb(100, 255,0,0)
		z = 0
		
		# Stored coordinate is the bottom left, but the draw coordinate is the top right
		
		x = @body.p.x.to_px
		y = @window.height - @body.p.y.to_px - TILE_HEIGHT
		
		@@spritesheet[@index].draw x,y,0
		
		#~ @window.draw_quad	x, y, color,
							#~ x + TILE_WIDTH, y, color,
							#~ x + TILE_WIDTH, y + TILE_HEIGHT, color,
							#~ x, y + TILE_HEIGHT, color
	end
end

class Surface1 < Platform
	def initialize(window, x,y)
		#~ verts = [
			#~ CP::Vec2.new(0, 0),
			#~ CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			#~ CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			#~ CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		#~ ]
		
		verts = [
			CP::Vec2.new(35.to_meters, TILE_HEIGHT.to_meters-52.to_meters),
			CP::Vec2.new(181.to_meters, TILE_HEIGHT.to_meters-47.to_meters),
			CP::Vec2.new(211.to_meters, TILE_HEIGHT.to_meters-173.to_meters),
			CP::Vec2.new(78.to_meters, TILE_HEIGHT.to_meters-231.to_meters)
		]
		
		
		super(window, 0, verts, x,y)
	end
end

class Surface2 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(214.to_meters, 126.to_meters),
			CP::Vec2.new(134.to_meters, 25.to_meters),
			CP::Vec2.new(68.to_meters, 54.to_meters),
		]
		
		
		super(window, 1, verts, x,y)
	end
end

class Surface3 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(TILE_WIDTH.to_meters, 0),
			CP::Vec2.new(66.to_meters, 60.to_meters),
			CP::Vec2.new(63.to_meters, 128.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters)
		]
		
		
		super(window, 2, verts, x,y)
	end
end

class Surface4 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 3, verts, x,y)
	end
end

class Surface5 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(91.to_meters, 137.to_meters),
			CP::Vec2.new(172.to_meters, 160.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 4, verts, x,y)
	end
end

class Surface6 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 5, verts, x,y)
	end
end

class Surface7 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		super(window, 6, verts, x,y)
	end
end

class Surface8 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 7, verts, x,y)
	end
end

class Surface9 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(228.to_meters, 127.to_meters),
			CP::Vec2.new(0, 0)
		]
		
		
		super(window, 8, verts, x,y)
	end
end

class Surface10 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(197.to_meters, 124.to_meters)
		]
		
		
		super(window, 9, verts, x,y)
	end
end

class Surface11 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 10, verts, x,y)
	end
end

class Surface12 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 11, verts, x,y)
	end
end

class Surface13 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 12, verts, x,y)
	end
end

class Surface14 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 13, verts, x,y)
	end
end

# Should have randomly placed trees appear on top, with a certain probability
class Surface15 < Platform
	TREE_CHANCE = 0.2
	
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 14, verts, x,y)
		
		@@tree_img ||= Gosu::Image.new(window, "./Sprites/Tree.png", false)
		
		if rand < TREE_CHANCE
			@tree_visible = true
		end
		# Position relative to the platform
		@tree_x = TILE_WIDTH/2-@@tree_img.width/2
		@tree_y = 35
	end
	
	def draw
		super()
		
		if @tree_visible
			x = @body.p.x.to_px
			y = @window.height - @body.p.y.to_px - TILE_HEIGHT
			@@tree_img.draw(x+@tree_x, y+@tree_y-@@tree_img.height, -5)
		end
	end
end

class Surface16 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 15, verts, x,y)
	end
end
