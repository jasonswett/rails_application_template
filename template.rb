def source_paths
  [__dir__]
end

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'webdrivers'
  gem 'faker'
end

template "config/database.yml.tt", "config/database.yml", force: true
template "docker-compose.yml.tt", "docker-compose.yml", force: true

[
  "bin/setup",

].each do |file_path|
  copy_file file_path, file_path, force: true
end

directory "post_templates", "post_templates"

after_bundle do
  run 'bin/spring stop'
end
