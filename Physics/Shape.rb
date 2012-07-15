module Physics
	module Shape
		class Circle < CP::Shape::Circle
			def initialize(gameobject, *args)
				super(*args)
				self.object = gameobject
			end
			
			def gameobject
				return self.object
			end
		end
		
		class Poly < CP::Shape::Poly
			def initialize(gameobject, *args)
				super(*args)
				self.object = gameobject
			end
			
			def gameobject
				return self.object
			end
		end
		
		class Rect < Poly
			attr_reader :width, :height
			
			def initialize(gameobject, body, width, height, offset=CP::ZERO_VEC_2)
				@width = width
				@height = height
				
				verts = [
					CP::Vec2.new(0,0),
					CP::Vec2.new(0,height),
					CP::Vec2.new(width, height),
					CP::Vec2.new(width,0)
				]
				super(gameobject, body, verts, offset)
			end
		end
	end
end
