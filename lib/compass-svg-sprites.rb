require "sass_functions.rb"

base_directory        = File.join(File.dirname(__FILE__), "..")
stylesheets_directory = File.join(base_directory, "stylesheets")

Compass::Frameworks.register("compass-svg-sprites", stylesheets_directory: stylesheets_directory)
