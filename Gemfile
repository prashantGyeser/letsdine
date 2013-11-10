source 'http://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'carrierwave'
gem 'fog'
gem 'rmagick'
#gem "mini_magick"
gem 'devise', '>= 3.2.0'
gem 'omniauth-facebook'
gem 'simple-navigation'


# Server for heroku
gem 'unicorn'

# Koala gem to interact with facebook and post to the users wall
gem 'koala'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do 
	gem 'turn'
	gem 'rspec-rails'
	gem 'capybara'
	gem 'rb-inotify', '~> 0.9'
	gem 'guard-rspec'
	gem 'minitest'
	gem 'zeus'
	gem 'annotate'

	# Gem list taken from: http://www.codebeerstartups.com/2013/04/must-have-gems-for-development-machine-in-ruby-on-rails/
	gem "better_errors"
    gem "binding_of_caller"
	gem 'bullet'
	gem 'debugger'
	gem 'flay'
	gem 'hirb'
	gem 'localtunnel'
	gem 'lol_dba'
	gem 'mailcatcher'
	gem 'meta_request','0.2.1'
	gem 'pry'
	gem 'pry-doc'
	gem 'quiet_assets'
	#gem 'rack-mini-profiler'
	#gem 'railroady'
	#gem 'rails-footnotes', '>= 3.7.9'
	gem 'rails_best_practices'
	gem 'reek'
	gem 'request-log-analyzer'
	gem 'smusher'

	# Unit testing gems
	gem 'shoulda-matchers'

  gem 'sass'
  gem 'sass-globbing'
  gem 'oily_png'
  gem 'css_parser'

	# Auto running
	gem 'guard'
	gem 'guard-spork'
	gem 'minitest'
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'rb-fsevent',       require: false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Performance monitoring
gem 'newrelic_rpm'
gem 'statsmix'

# Email 
gem "mandrill-api", "~> 1.0.27"

# IP based city detection
gem 'geocoder'


# Authorization
gem "cancan"

# Intercom 
#gem 'intercom-rails'

# Updated json gem
gem 'json', '~> 1.7.7'

# Friendly urls
gem "friendly_id"

# Textile markup editor
gem 'RedCloth'

# Speed up precompile by only compiling the files that have changed
gem 'turbo-sprockets-rails3'

# Adding librato metric to the app. Look at librato.com for details
# Also see https://devcenter.heroku.com/articles/librato for heroku deployment instructions
gem 'librato-rails'

# Adding a gem to handle markdown formated text. Right now the templates only support Textile markup
gem 'bluecloth'

# Gem to remove all the html tags
gem 'sanitize'

# Getting records by time i.e. year, month, week, etc
#gem 'by_star', :git => "git://github.com/radar/by_star"
gem 'by_star'

# Monitoring gems
gem "bugsnag"

# Gzipping files gem
gem 'heroku_rails_deflate', :group => :production

# algoliasearch search gem - Refer to algoliasearch.com for more details
gem "algoliasearch-rails"

# Serializer to generate json data
gem "active_model_serializers"