source "http://gemcutter.org"

BASEPATH = File.absolute_path(File.dirname(__FILE__))

# OS Specific gems
if RUBY_PLATFORM.downcase.include?("linux")
	# Linux
	
elsif RUBY_PLATFORM.downcase.include?("mswin32")
	puts "mswin32 ruby interpreter currently not supported."
	puts "Feel free to install dependencies manually at your own risk."
	
elsif RUBY_PLATFORM.downcase.include?("mingw")
	# RubyInstaller.org interpreter for Windows
	
elsif RUBY_PLATFORM.downcase.include?("darwin")
	# OSX
	
end

# General gem dependencies
gem "require_all"
gem "gosu", "~>0.7.43"
gem "chipmunk", "~>5.3.4.5"
