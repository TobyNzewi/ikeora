source 'https://rubygems.org'

ruby "2.3.0"

gem 'rails', '4.2.5'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem "slim-rails"
gem 'foreman'
gem 'unicorn'
gem "figaro"
gem 'devise',           '~> 3.5.2'
gem 'devise_invitable', '~> 1.5.2'
gem 'activeadmin', '1.0.0.pre2'
gem 'omniauth-facebook'
gem 'cancancan', '~> 1.10'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'byebug'
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
  gem 'simplecov', :require => false
end

group :development do
  gem 'spring'
  gem 'letter_opener'
end

group :production do
  gem 'rails_12factor'
end

