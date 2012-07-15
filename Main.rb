#!/usr/bin/env ruby
Dir.chdir File.dirname(__FILE__)

require 'rubygems'
require "bundler/setup"

require 'gosu'
require 'chipmunk'
require 'require_all'

require_all './Physics'
require_all './Gameobjects'
require_all './Utilities'
require_all './Debug'

require './Jukebox'

class GameWindow < Gosu::Window
	attr_reader :player, :jukebox, :font
	attr_reader :zoom
	
	def initialize
		@target_fps = 60
		
		super(1280, 720, false, (1.0/@target_fps)*1000)
		self.caption = "Mini Ludum Dare 36"
		
		@show_fps = false
		@show_debug_output = true
		
		@font = Gosu::Font.new self, "Trebuchet MS", 25
		
		@debug = DebugOutput.new self
		
		@jukebox = Jukebox.new self
		
		@space = Physics::Space.new 1.0/@target_fps
		# Determine keyboard layout on Linux
		# setxkbmap -v | awk -F "+" '/symbols/ {print $2}'
		
		# Create gameobjects
		@player = Player.new self
		@platforms = [
			Platform.new(self, 200, 1)
		]
		
		# Add gameobjects to space
		@player.add_to @space
		@platforms.each do |p|
			p.add_to @space
		end
		
		@inpman = GameInput.new @player, @jukebox
		
		target_sprite_height = 100.0
		@default_zoom = target_sprite_height/Physics::CHARACTER_HEIGHT_PX
		@zoom = target_sprite_height/Physics::CHARACTER_HEIGHT_PX
	end
	
	def update
		@inpman.update
		
		# Constrain zoom to positive
		min_zoom = 0.01
		@zoom = min_zoom if @zoom < min_zoom
		
		
		@space.step
		
		@player.update
		
		
		@debug.update
	end
	
	def draw
		# Draw gamestate
		self.translate self.width/2, -100 do
			self.scale @zoom, @zoom, 0,self.height do
				self.translate -@player.body.p.x.to_px, 0 do
					@player.draw
					
					@platforms.each do |p|
						p.draw
					end
				end
			end
		end
		
		self.flush
		
		# Draw UI
		if @show_fps
			@font.draw "FPS: #{Gosu::fps}", 10,10,10, 1,1, Gosu::Color::FUCHSIA
		end
		
		if @show_debug_output
			self.flush
			
			@debug.draw
		end
	end
	
	def button_down(id)
		@inpman.button_down(id)
		
		case id
			when Gosu::KbEscape
				close
			when Gosu::KbF
				@show_fps = !@show_fps
			
			when Gosu::MsWheelUp
				@zoom += 0.01
			when Gosu::MsWheelDown
				@zoom -= 0.01
			
			when Gosu::KbF1
				@show_debug_output = !@show_debug_output
		end
	end
	
	def button_up(id)
		@inpman.button_up(id)
	end
	
	def needs_cursor?
		true
	end
end

window = GameWindow.new
window.show

window.jukebox.save
