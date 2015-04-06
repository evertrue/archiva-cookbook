require 'chefspec'
require 'chefspec/berkshelf'
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.platform  = 'ubuntu'
  config.version   = '14.04'
  config.log_level = :fatal
end
