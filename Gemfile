source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby "3.2.2"
gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem 'pg'
gem 'pg_search'
gem "pgcrypto"
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma'
gem "faker"
gem 'rails-i18n'
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"
gem 'sprockets-rails'
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"
#turbo
gem "turbo-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
gem "vite_rails", "~> 3.0"
#auth
gem 'devise'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
# css
gem 'escompress'
gem 'tailwindcss-rails'
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Read more: https://github.com/fnando/browser
gem 'browser'

# Image & Video processors
# file uploader. Read more: https://github.com/carrierwaveuploader/carrierwave
# Read more: https://github.com/jtescher/carrierwave-imageoptimizer
gem 'carrierwave' #, '~> 3.0'
gem 'carrierwave-base64'
gem 'carrierwave-video'
# gem 'carrierwave-audio' #https://github.com/TrevorHinesley/carrierwave-audio
gem 'streamio-ffmpeg'
gem 'carrierwave-processing'
gem 'carrierwave-imageoptimizer'
gem 'carrierwave-video-thumbnailer'
gem 'rmagick'
gem 'mini_magick'

# Catch errors
gem "sentry-ruby"
gem "sentry-rails"

# Optimize html
gem "htmlcompressor"

if RUBY_PLATFORM =~ /x86_64-linux/
  gem 'webp-ffi'
	gem 'mini_racer', platforms: :ruby
end

group :development, :test do
  gem "web-console"
end
