source 'https://rubygems.org'

group :test, :development do
  gem 'rake'
  gem 'coveralls', require: false
end

group :test do
  gem 'berkshelf',  '~> 3.1'
  gem 'chefspec',   '~> 4.0'
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop',    '~> 0.23'

  gem 'test-kitchen',
      github: 'test-kitchen/test-kitchen',
      ref: '459238b88ccb4219d8bcabd5a89a8adcb7391b16'
  gem 'kitchen-ec2',
      github: 'test-kitchen/kitchen-ec2',
      tag: 'e7f840f927518b0f9e29914205c048a463de654e'
end

group :test, :vagrant do
  gem 'kitchen-vagrant', '~> 0.15'
end
