module Physics
	module Shape
		class Circle < CP::Shape::Circle
			def initialize(*args)
				super(*args)
			end
		end
		
		class Poly < CP::Shape::Poly
			def initialize(*args)
				super(*args)
			end
		end
		
		class Rect < Poly
			attr_reader :width, :height
			
			def initialize(body, width, height, offset=CP::ZERO_VEC_2)
				@width = width
				@height = height
				
				verts = [
					CP::Vec2.new(0,0),
					CP::Vec2.new(0,height),
					CP::Vec2.new(width, height),
					CP::Vec2.new(width,0)
				]
				super(body, verts, offset)
			end
		end
	end
end
