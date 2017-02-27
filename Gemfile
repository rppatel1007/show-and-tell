source 'https://rubygems.org'

# git_source(:github) do |repo_name|
#   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
#   "https://github.com/#{repo_name}.git"
# end

gem 'rails', '~> 5.0.1'

gem 'pg', '~> 0.18'

gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'flip'
gem 'simple_form'

gem 'httparty'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '~> 0.42.0', require: false
  gem 'brakeman'
end

group :development, :test, :travis do
  gem 'pry'
  gem 'better_errors', '>= 2.0.0'
  gem 'binding_of_caller'
end

group :acceptance, :test, :travis do
  gem 'simplecov', '~> 0.12.0'
  gem 'simplecov-rcov', '~> 0.2.3'
  gem 'codeclimate-test-reporter', require: nil
  gem 'vcr'
  gem 'rack_session_access'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'cucumber-rails', require: false
  gem 'minitest-spec-rails'
  gem 'minitest-rails'
  gem 'phantomjs', '~> 1.9.8.0'
  gem 'mocha', '~> 1.1.0'
end