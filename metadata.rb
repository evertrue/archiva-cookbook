name             'archiva'
maintainer       'EverTrue'
maintainer_email 'devops@evertrue.com'
license          'Apache-2.0'
description      'Installs/Configures Archiva'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'
chef_version     '>= 12.7' if respond_to?(:chef_version)
source_url       'https://github.com/evertrue/archiva-cookbook'
issues_url       'https://github.com/evertrue/archiva-cookbook/issues'

supports 'ubuntu', '>= 12.04'
supports 'debian', '~> 7.2.0'

depends 'apt',   '~> 2.5'
depends 'ark'
depends 'java',  '~> 1.27'
depends 'chef_nginx', '~> 5.0'
