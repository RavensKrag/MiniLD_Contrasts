# Control sounds for the game
require 'yaml'

class Jukebox
	attr_accessor :music_index, :sound_index
	attr_reader :current_music_volume, :current_sound_volume
	
	VOLUME_INCREMENTATION = 0.01
	VOLUME_LEVELS_FILE = "./Music/sound_levels.yaml"
	
	def initialize(window)
		# NOTE: Current sound value is only saved when the track switches.
		@window = window
		
		@music_index = 0
		@sound_index = 0
		
		@current_music_volume = 1.0
		@current_sound_volume = 1.0
		
		@music = [
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Background/Contrast_background_02.ogg")
		]
		
		@sounds = [
			Gosu::Sample.new(@window, "./Music/Effects/concrete_jump_land_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_jump_land_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_jump_land_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_slide_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_slide_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_04.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/concrete_step_05.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_04.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/grass_step_05.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/projectile_block_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/projectile_block_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/projectile_block_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_01.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_02.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_03.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_04.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_05.ogg"),
			Gosu::Sample.new(@window, "./Music/Effects/sword_swing_06.ogg")
		]
		
		@volumes = {
			:music => [],
			:sounds => []
		}
		
		#~ @music[1].play 1, 1, true
		# volume (0-1), speed, loop
		# @music play_pan(pan = 0, vol = 1, speed = 1, looping = false)
		
		self.load # load volume settings
	end
	
	def next_music
		@current_music.stop if @current_music
		@volumes[:music][@music_index] = @current_music_volume
		
		@music_index += 1
		@music_index = 0 if @music_index >= @music.length
	end
	
	def next_sound
		if @current_sound
			@current_sound.stop 
			@volumes[:sounds][@sound_index] = @current_sound_volume
		end
		
		@sound_index += 1
		@sound_index = 0 if @sound_index >= @sounds.length
	end
	
	def play_music
		@current_music_volume = @volumes[:music][@music_index]
		unless @current_music_volume
			default_volume = 0.5
			@volumes[:music][@music_index] = default_volume
			@current_music_volume = default_volume
		end
		
		@current_music = @music[@music_index].play @current_music_volume
	end
	
	def play_sound
		@current_sound_volume = @volumes[:sounds][@sound_index]
		unless @current_sound_volume
			default_volume = 0.5
			@volumes[:sounds][@sound_index] = default_volume
			@current_sound_volume = default_volume
		end
		
		@current_sound = @sounds[@sound_index].play @current_sound_volume
	end
	
	def music_volume_up
		if @current_music
			@current_music_volume += VOLUME_INCREMENTATION
			
			# Bound volume
			if @current_music_volume > 1.0
				@current_music_volume = 1.0
			elsif @current_music_volume < 0.0
				@current_music_volume = 0.0
			end
			
			@current_music.volume = @current_music_volume
			@volumes[:music][@music_index] = @current_music_volume
		end
	end
	
	def music_volume_down
		if @current_music
			@current_music_volume -= VOLUME_INCREMENTATION
			
			# Bound volume
			if @current_music_volume > 1.0
				@current_music_volume = 1.0
			elsif @current_music_volume < 0.0
				@current_music_volume = 0.0
			end
			
			@current_music.volume = @current_music_volume
			@volumes[:music][@music_index] = @current_music_volume
		end
	end
	
	def sound_volume_up
		if @current_sound
			puts "up"
			@current_sound_volume += VOLUME_INCREMENTATION
			
			# Bound volume
			if @current_sound_volume > 1.0
				@current_sound_volume = 1.0
			elsif @current_sound_volume < 0.0
				@current_sound_volume = 0.0
			end
			
			@current_sound.volume = @current_sound_volume
			@volumes[:sounds][@sound_index] = @current_sound_volume
		end
	end
	
	def sound_volume_down
		if @current_sound
			@current_sound_volume -= VOLUME_INCREMENTATION
			
			# Bound volume
			if @current_sound_volume > 1.0
				@current_sound_volume = 1.0
			elsif @current_sound_volume < 0.0
				@current_sound_volume = 0.0
			end
			
			@current_sound.volume = @current_sound_volume
			@volumes[:sounds][@sound_index] = @current_sound_volume
		end
	end
	
	def save
		File.open(VOLUME_LEVELS_FILE, "w") do |f|
			f.puts YAML::dump(@volumes)
		end
	end
	
	def load
		if File.exist?(VOLUME_LEVELS_FILE)
			@volumes = YAML::load(File.open(VOLUME_LEVELS_FILE, "r"))
			p @volumes
		end
	end
end
