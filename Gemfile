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

  gem 'test-kitchen', '~> 1.3'
  gem 'kitchen-ec2',
      github: 'test-kitchen/kitchen-ec2',
      tag: '8325c9d1aca590189b2a3e736c85acbdd83b3e7f'
end

group :test, :vagrant do
  gem 'kitchen-vagrant', '~> 0.15'
end
