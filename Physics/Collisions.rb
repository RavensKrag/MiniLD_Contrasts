module Physics
	module Collisions
		# Define collision between an entity and a static object
		class EntityStatic
			def initialize
				
			end
			
			def begin(arbiter)
				return true
			end
			
			def pre_solve(arbiter) #Determine whether to process collision or not
				#Process actions involving what to do when on top, as well as side collisions
				
				entity = arbiter.a.gameobject
				entity.reset_jump # TODO: Reset only if colliding from top
				
				return true
			end
			
			def post_solve(arbiter, a, b) #Do stuff after the collision has be evaluated
				
			end
			
			def separate(arbiter, a, b)	#Stuff to do after the shapes separate
				
			end
		end
	end
end
