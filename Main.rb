require 'rubygems'
require 'gosu'
require 'chipmunk'

class GameWindow < Gosu::Window
	def initialize
		@target_fps = 60
		
		super(1280, 720, false, (1.0/@target_fps)*1000)
		self.caption = "Mini Ludum Dare 36"
		
		@show_fps = false
		
		@font = Gosu::Font.new self, "Trebuchet MS", 25
		
		# Determine keyboard layout on Linux
		# setxkbmap -v | awk -F "+" '/symbols/ {print $2}'
		
	end
	
	def update
		
	end
	
	def draw
		if @show_fps
			@font.draw "FPS: #{Gosu::fps}", 10,10,10, 1,1, Gosu::Color::FUCHSIA
		end
	end
	
	def button_down(id)
		case id
			when Gosu::KbEscape
				close
			when Gosu::KbF
				@show_fps = true
		end
	end
	
	def button_up(id)
		
	end
end

GameWindow.new.show
