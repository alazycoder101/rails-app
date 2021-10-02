source 'https://rubygems.org'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rails'
gem 'devise'
gem 'devise-jwt', '~> 0.7.0'
gem 'pundit'
gem 'rolify'
gem 'friendly_id', '~> 5.4.0'
gem 'foreman'
gem 'jsonapi-rails'
gem 'puma', '~> 5.3'
gem 'rack-cors'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'solargraph'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'chromedriver-helper'
  gem 'vcr'
  gem 'webdrivers'
  gem 'jsonapi-rspec'
  gem 'webmock'
end

group :production do
  gem 'pg', '>= 0.18', '< 2.0'
end
