name             'archiva'
maintainer       'EverTrue'
maintainer_email 'devops@evertrue.com'
license          'Apache v2.0'
description      'Installs/Configures Archiva'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'

supports 'ubuntu', '>= 12.04'
supports 'debian', '~> 7.2.0'

depends 'apt',   '~> 2.5'
depends 'ark'
depends 'java',  '~> 1.27'
depends 'chef_nginx', '~> 5.0'
