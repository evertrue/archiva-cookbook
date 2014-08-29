name             'archiva'
maintainer       'Jorge Espada'
maintainer_email 'espada.jorge@gmail.com'
license          'Apache v2.0'
description      'Installs/Configures Archiva'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

supports 'ubuntu', '= 12.04'
supports 'debian', '~> 7.2.0'

depends 'ark',   '~> 0.9.0'
depends 'java',  '~> 1.27'
depends 'nginx', '~> 2.7'
