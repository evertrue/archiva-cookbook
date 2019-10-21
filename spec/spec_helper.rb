require 'chefspec'
require 'chefspec/berkshelf'
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.formatter = :documentation
  config.color     = true
  config.platform  = 'ubuntu'
  config.version   = '18.04'
  config.log_level = :fatal
end

at_exit { ChefSpec::Coverage.report! }
