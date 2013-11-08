set :tracks, [
  {:num => "01",
   :track => "01. Firedrill ✰ MINIBURGERTIME (original mix)",
   :mp3 => "01-firedrill-miniburgertime_original_mix.mp3"},
  {:num => "02",
   :track => "02. Dr. Akane ✰ MINIBURGERTIME (cafeteria mix)",
   :mp3 => "02-dr_akane-miniberg.mp3"},
  {:num => "03",
   :track => "03. Freedrull ✰ MINIBURGERTIME (shed mix)",
   :mp3 => "03-freedrull-miniburgertime_shed_mix.mp3"},
  {:num => "04",
   :track => "04. CRZKNY ✰ MINIBURGERTIME (hiroshima fwk mix)",
   :mp3 => "04-CRZKNY-miniburgertime_hiroshima_fwk_remix.mp3"},
  {:num => "05",
   :track => "05. Freedrull ✰ MINIBURGERTIME (real miniburger shit)",
   :mp3 => "05-freedrull-miniburgertime_real_miniburger_shit.mp3"},
  {:num => "06",
   :track => "06. Freedrull ✰ MINIBURGERTIME (minicanadianburger)",
   :mp3 => "06-freedrull-miniburgertime_minicandianburger.mp3"},
  {:num => "07",
   :track => "07. Abducted By Sharks ✰ MINIBURGERTIME (teo mix)",
   :mp3 => "07-abducted_by_sharks-miniburgertime_teo_remix.mp3"},
  {:num => "08",
   :track => "08. Ovenrake ✰ MINIBURGERTIME (burgerdik mix)",
   :mp3 => "08-ovenrake-miniburgertime_burgerdik_mix.mp3"},
  {:num => "09",
   :track => "09. Ridylan ✰ MINIBURGERTIME (ridylan remix)",
   :mp3 => "09-ridylan-miniburgertime_ridylan_remix.mp3"},
  {:num => "10",
   :track => "10. DKSTR ✰ MINIBURGERTIME (DKSTR Paussi Special remix)",
   :mp3 => "10-dkstr-miniburgertime_dkstr_paussi_special_remix.mp3"}
]

set :foods, ["img/burger1.png","img/eggsaladsandwich.png","img/jellyburger.png","img/sloppyjoe.png"]

set :df004, [
  {:num => "01",
    :track => "01. GRIME OF FUTURE PAST",
   :mp3 => "01-sea_cuke-grime_of_future_past.mp3"},
  {:num => "02",
   :track => "02. GARAGE CLUB",
   :mp3 => "02-sea_cuke-garage_club.mp3"},
  {:num => "03",
   :track => "03. FIREDRILL - SLURPIT (SEA CUKE REMIX)",
   :mp3 => "03-firedrill-slurpit_sea_cuke_remix.mp3"}
]

set :df005, [
  {:num => "01",
   :track => "firedrill - pineapple bog",
   :mp3 => "01_firedrill_pineapple-bog.mp3",
  :image => "https://s3.amazonaws.com/DF005/img/pineapple.jpg"},
  {:num => "02",
   :track => "ovenrake - ult bem bem",
   :mp3 => "02_ovenrake_ultbembem.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/back295.jpg"},
  {:num => "03",
   :track => "korma - BB6600",
   :mp3 => "03_Korma_BB6600.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/person_with_pouting_face.png"},
  {:num => "04",
   :track => "firedrill - w!ld remix",
   :mp3 => "04_firedrill_w!ld_grime_remix.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/datafruits.jpg"},
  {:num => "05",
   :track => "mojogoro - I LUV U remix",
   :mp3 => "05_mojogoro_I+LUV+U+MOJOGORO+RMX.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/postcard1.png"},
  {:num => "06",
   :track => "the ghost potemkin - deeper boy",
   :mp3 => "06_the-ghost-potemkin_DeeperBoy.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/seeponk.png"},
  {:num => "07",
   :track => "ind_fris - willie",
   :mp3 => "07_ind-fris_Willie.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/drips.png"},
  {:num => "08",
   :track => "carpainter - heat up",
   :mp3 => "08_Carpainter_HeatUp.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/train.jpg"},
  {:num => "09",
   :track => "peaches the whale - wot u call it (boat shed)",
   :mp3 => "09_peaches-the-whale_wot+u+call+it+(boat+shed).mp3",
   :image => "https://s3.amazonaws.com/DF005/img/efm.jpg"}
]

set :df006, [
  {:num => "01",
   :track => "herokkin remix",
   :mp3 => "01_DooDaDoo_Herokkin-Remix.mp3"},
  {:num => "02",
   :track => "DJ DAI remix",
   :mp3 => "02_DooDaDoo_DJ-DAI-REMIX.mp3"},
  {:num => "03",
   :track => "firedrill remix",
   :mp3 => "03_DooDaDoo_firedrill-remix.mp3"},
  {:num => "04",
   :track => "ovenrake remix",
   :mp3 => "04_DooDaDoo_ovenrake-remix.mp3"},
  {:num => "05",
   :track => "seacuke remix",
   :mp3 => "05_DooDaDoo_seacuke-remix.mp3"},
  {:num => "06",
   :track => "dj nameko edit",
   :mp3 => "06_DooDaDoo_dj-nameko-edit.mp3"}
]

###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def cycle
    @_cycle ||= reset_cycle
    @_cycle = [@_cycle.pop] + @_cycle
    @_cycle.first
  end

  def reset_cycle
    @_cycle = ["img/burger1.png","img/eggsaladsandwich.png","img/jellyburger.png","img/sloppyjoe.png"]
  end
end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

activate :directory_indexes

set :build_dir, "tmp"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
