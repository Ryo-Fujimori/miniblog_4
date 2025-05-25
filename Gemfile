source 'https://rubygems.org'

gem 'rails', '~> 8.0.2'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'propshaft'
gem 'puma', '>= 5.0'
gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'
gem 'sqlite3', '>= 2.1'
gem 'stimulus-rails'
gem 'thruster', require: false
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'devise'
gem 'haml-rails'
gem 'pagy'
gem 'rails-i18n'
gem 'simple_form'
# 画像アップロード用
gem 'image_processing'

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'rubocop-rails-omakase', require: false

  gem 'faker'
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'

  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end
