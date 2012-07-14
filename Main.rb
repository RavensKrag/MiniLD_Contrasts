#!/usr/bin/env ruby
Dir.chdir File.dirname(__FILE__)

require 'rubygems'
require 'gosu'
require 'chipmunk'
require 'require_all'

require_all './Physics'
require_all './Gameobjects'

require './Jukebox'

class GameWindow < Gosu::Window
	def initialize
		@target_fps = 60
		
		super(1280, 720, false, (1.0/@target_fps)*1000)
		self.caption = "Mini Ludum Dare 36"
		
		@show_fps = false
		
		@font = Gosu::Font.new self, "Trebuchet MS", 25
		
		@jukebox = Jukebox.new self
		
		@space = Physics::Space.new 1.0/@target_fps
		# Determine keyboard layout on Linux
		# setxkbmap -v | awk -F "+" '/symbols/ {print $2}'
		
		# Create gameobjects
		@player = Player.new self
		
		# Add gameobjects to space
		@player.add_to @space
		
		@zoom = 1
	end
	
	def update
		# Constrain zoom to positive
		@zoom = 1 if @zoom < 1
		
		
		@space.step
		
		@player.update
		
		puts @player.body.p.x
	end
	
	def draw
		# Draw UI
		if @show_fps
			@font.draw "FPS: #{Gosu::fps}", 10,10,10, 1,1, Gosu::Color::FUCHSIA
		end
		
		# Draw gamestate
		self.translate self.width/2, self.height-200 do
			self.scale @zoom, @zoom do
				self.translate -@player.body.p.x, -@player.body.p.y do
					@player.draw
				end
			end
		end
	end
	
	def button_down(id)
		case id
			when Gosu::KbEscape
				close
			when Gosu::KbF
				@show_fps = true
			
			when Gosu::KbLeft
				@player.move_left
			when Gosu::KbRight
				@player.move_right
			
			when Gosu::MsWheelUp
				@zoom += 0.1
			when Gosu::MsWheelDown
				@zoom -= 0.1
			when Gosu::MsLeft
				puts @zoom
		end
	end
	
	def button_up(id)
		
	end
	
	def needs_cursor?
		true
	end
end

GameWindow.new.show
