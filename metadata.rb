name             'archiva'
maintainer       'EverTrue'
maintainer_email 'devops@evertrue.com'
license          'Apache v2.0'
description      'Installs/Configures Archiva'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.0.1'

supports 'ubuntu', '>= 16.04'
supports 'debian', '~> 9.0.0'

depends 'apt',   '~> 7.2.0'
depends 'ark',   '~> 4.0.0'
depends 'java',  '~> 4.3.0'
depends 'nginx', '~> 10.0.1'
