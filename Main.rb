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
		
		#~ @jukebox = Jukebox.new self
		
		@space = Physics::Space.new 1.0/@target_fps
		# Determine keyboard layout on Linux
		# setxkbmap -v | awk -F "+" '/symbols/ {print $2}'
		
		# Create gameobjects
		@player = Player.new self
		@platforms = [
			Platform.new(self, 500, 20)
		]
		
		# Add gameobjects to space
		@player.add_to @space
		@platforms.each do |p|
			#~ p.add_to @space
		end
		
		target_sprite_height = 100.0
		@zoom = target_sprite_height/Physics::CHARACTER_HEIGHT_PX
	end
	
	def update
		# Constrain zoom to positive
		#~ @zoom = 1 if @zoom < 1
		
		
		@space.step
		
		@player.update
		
		puts @player.body.p.y
		#~ puts @player.shape.width
	end
	
	def draw
		# Draw UI
		if @show_fps
			@font.draw "FPS: #{Gosu::fps}", 10,10,10, 1,1, Gosu::Color::FUCHSIA
		end
		
		# Draw gamestate
		#~ self.translate self.width/2, self.height do
			#~ self.scale @zoom, @zoom do
				#~ self.translate -@player.body.p.x, -@player.body.p.y do
					@player.draw
					
					@platforms.each do |p|
						p.draw
					end
				#~ end
			#~ end
		#~ end
		
		x = 0
		y = self.height
		# Draws white box at the origin
		self.draw_quad	x,		y, Gosu::Color::WHITE,
						x+100,	y, Gosu::Color::WHITE,
						x+100,	y-100, Gosu::Color::WHITE,
						x+0,	y-100, Gosu::Color::WHITE
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
			when Gosu::KbSpace
				@player.jump
			
			when Gosu::MsWheelUp
				@zoom += 0.01
			when Gosu::MsWheelDown
				@zoom -= 0.01
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
