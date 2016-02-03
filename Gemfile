source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'

# PostgreSQL Database
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.1'

# Bootswatch Template
gem 'bootswatch-rails'

# Authentication
gem 'devise'
gem 'omniauth-facebook'

# Authorization
gem 'cancancan'

# Pagination
gem 'will_paginate', '~> 3.0.5'
gem 'will_paginate-bootstrap'

# Image uploading
gem 'carrierwave'
gem 'mini_magick'
# Cloud storage
gem 'cloudinary'
# Ajax image uploads
gem 'remotipart'

# Make Turbolinks and jQuery play nice
gem 'jquery-turbolinks'
# PNotify
gem 'pnotify-rails'

# Admin area
gem 'rails_admin'

gem 'sprockets-rails'

# Test Suite
group :test do 
	gem 'capybara'
	gem 'launchy'
	gem 'database_cleaner', github: 'bmabey/database_cleaner'
	gem 'poltergeist'
end

# Development testing
group :development, :test do 
  gem 'rspec-rails', '~> 3.1'
  gem 'factory_girl_rails'
  gem 'byebug'
end

group :development do
  gem 'bullet'
  gem 'web-console', '~> 2.0'
end

# For heroku (ensures that asset pipeline is correctly used)
group :production, :staging do
	gem 'rails_12factor'
end

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
