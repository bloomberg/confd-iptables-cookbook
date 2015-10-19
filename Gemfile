source 'https://rubygems.org'
gem 'poise', '~> 2.2'
gem 'poise-service', '~> 1.0'
gem 'poise-boiler'
gem 'toml'

group :test, :development do
  gem 'chef-dk'
  gem 'chef-provisioning-vagrant'
  gem 'zk'
end

group :lint do
  gem 'rubocop'
  gem 'foodcritic'
end

group :kitchen_common do
  gem 'test-kitchen', '~> 1.4'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant', '~> 0.17'
end

group :kitchen_cloud do
  gem 'kitchen-openstack', '~> 1.8'
end

group :unit do
  gem 'berkshelf'
  gem 'chefspec'
end

group :integration do
  gem 'serverspec'
end

group :development do
  gem 'awesome_print'
  gem 'guard-kitchen'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rake'
  gem 'stove'
end

group :doc do
  gem 'yard'
end
