#!/usr/bin/env ruby

require 'rubygems'
require 'gosu'
require 'chipmunk'
require 'require_all'

require_all './Physics'
require_all './Gameobjects'

class GameWindow < Gosu::Window
	def initialize
		@target_fps = 60
		
		super(1280, 720, false, (1.0/@target_fps)*1000)
		self.caption = "Mini Ludum Dare 36"
		
		@show_fps = false
		
		@font = Gosu::Font.new self, "Trebuchet MS", 25
		
		@space = Physics::Space.new 1.0/@target_fps
		# Determine keyboard layout on Linux
		# setxkbmap -v | awk -F "+" '/symbols/ {print $2}'
		
		# Create gameobjects
		@player = Player.new self
		
		# Add gameobjects to space
		@player.add_to @space
	end
	
	def update
		@space.step
		
		@player.update
	end
	
	def draw
		# Draw UI
		if @show_fps
			@font.draw "FPS: #{Gosu::fps}", 10,10,10, 1,1, Gosu::Color::FUCHSIA
		end
		
		# Draw gamestate
		@player.draw
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
