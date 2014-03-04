require "mini_magick"

module Sass::Script::Functions
  def svg_sprite_files(directory)
    Compass.configuration.sprite_load_path.compact.each do |compass_directory|
      files = Sass::Util.glob(File.join(compass_directory, directory)).sort
      next if files.empty?
      return files
    end

    path = Compass.configuration.sprite_load_path.to_a.join(", ")
    raise Compass::SpriteException, %Q{No files were found in the load path matching "#{directory}". Your current load paths are: #{path}}
  end

  def svg_sprites(directory)
    assert_type directory, :String

    logger = Compass::Logger.new

    svg_sprite_files(directory.value).each do |absolute_directory|
      Dir.glob(File.join(absolute_directory, "*.svg")).each do |svg_path|
        png_filename = File.basename(svg_path, ".svg") + ".png"

        png_path = File.join(File.dirname(svg_path), png_filename)

        if File.exists? png_path
          logger.record :overwrite, png_path
        else
          logger.record :create, png_path
        end

        image = MiniMagick::Image.open(svg_path)
        image.format("png") do |c|
          c.background "transparent"
          c.antialias
        end
        image.write png_path
      end
    end

    Sass::Script::Bool.new true
  end

  declare :svg_sprites, :args => [:String]
end
