name	"chef-archiva"
maintainer       "Jorge Espada"
maintainer_email "espada.jorge@gmail.com"
license          "All rights reserved"
description      "Installs/Configures archiva"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.3"


%w(ark java).each { |cb| depends cb }

%w{debian}.each do |os|
  supports os
end
