class Platform < StaticObject
	TILE_WIDTH = 1024/4
	TILE_HEIGHT = 1024/4
	
	def initialize(window, index, verts, x,y)
		@index = index
		
		shape = CP::Shape::Poly.new CP::Body.new_static(), verts, CP::ZERO_VEC_2
		super(window, shape)
		
		@shape.u = 0.2
		@body.p.x = x
		@body.p.y = y
		
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
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 0, verts, x,y)
	end
end

class Surface2 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 1, verts, x,y)
	end
end

class Surface3 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 2, verts, x,y)
	end
end

class Surface4 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
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
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
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
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
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
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
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
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
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
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
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

class Surface15 < Platform
	def initialize(window, x,y)
		verts = [
			CP::Vec2.new(0, 0),
			CP::Vec2.new(0, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, TILE_HEIGHT.to_meters),
			CP::Vec2.new(TILE_WIDTH.to_meters, 0)
		]
		
		
		super(window, 14, verts, x,y)
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
