#!/usr/bin/env ruby
Dir.chdir File.dirname(__FILE__)

require 'rubygems'

gems = %x[gem list]
unless gems.include? "bundler"
	if RUBY_PLATFORM.downcase.include?("linux")
		# Linux
		%x[sudo gem install bundler]
	elsif RUBY_PLATFORM.downcase.include?("mswin32")
		puts "mswin32 ruby interpreter currently not supported."
		puts "Feel free to install dependencies manually at your own risk."
		
	elsif RUBY_PLATFORM.downcase.include?("mingw")
		# RubyInstaller.org interpreter for Windows
		%x[gem install bundler]
	elsif RUBY_PLATFORM.downcase.include?("darwin")
		# OSX
		# Assume installation for macruby
		%x[sudo macgem install bundler]
	end
end

exec "bundle install"
