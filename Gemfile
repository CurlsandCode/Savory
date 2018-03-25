source 'https://rubygems.org'
ruby '2.4.0'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers'
gem 'acts_as_votable', '~> 0.10.0'
gem 'aws-sdk', '~> 2.3'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'cocoon', '~> 1.2', '>= 1.2.11'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.2'
gem 'dotenv-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'paperclip', '~> 5.2.1'
gem 'pry'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'rubocop', '~> 0.52.1', require: false
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'typedjq-rails'
gem 'uglifier', '>= 1.3.0'
gem 'loofah', '~> 2.2.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.21'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
