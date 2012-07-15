class Numeric
	def to_px
		# Convert from meters to pixels
		(self*Physics::SCALE).floor
	end
	
	def to_meters
		# Convert from pixels to meters
		self/(Physics::SCALE) #Insure that integer division is not used
	end
end
