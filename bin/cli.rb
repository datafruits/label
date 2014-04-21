#!/usr/bin/env ruby
require "thor"

class NewRelease < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(File.expand_path("..",__FILE__))
  end

  def create_html
    n=Dir.glob("./source/df*").sort.last[-3..-1].to_i+1
    name = sprintf("df%03i", n)
    @new_dir = "./source/#{name}"
    Dir.mkdir @new_dir
    html = "#{@new_dir}/index.html.erb"
    copy_file("template/index.tt", html)
    gsub_file html, 'RELEASE_NAME', name
  end

  def create_css_js
    Dir.mkdir "#{@new_dir}/css"
    Dir.mkdir "#{@new_dir}/js"
    Dir.mkdir "#{@new_dir}/img"
    js = "#{@new_dir}/js/main.js.erb"
    copy_file("template/main.js.erb", js)
    main_css = "#{@new_dir}/css/main.scss"
    copy_file("template/main.scss", main_css)
    normalize_css = "#{@new_dir}/css/normalize.css"
    copy_file("template/normalize.css", normalize_css)
    jplayer_css = "#{@new_dir}/css/jplayer.css"
    copy_file("template/jplayer.css", jplayer_css)
    jplayer_img = "#{@new_dir}/img/jplayer.png"
    copy_file("template/jplayer.png", jplayer_img)
    seeking_gif = "#{@new_dir}/img/seeking.gif"
    copy_file("template/seeking.gif", seeking_gif)
  end
end

class DatafruitsLabel < Thor
  desc "foo", "Prints foo"
  def foo
    puts "foo"
  end

  register NewRelease, "new_release", "new_release", "Create the assets for a new release."
end

DatafruitsLabel.start
