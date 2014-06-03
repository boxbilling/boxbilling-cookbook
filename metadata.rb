name             'boxbilling'
maintainer       'Onddo Labs, Sl.'
maintainer_email 'team@onddo.com'
license          'Apache 2.0'
description      'Installs/Configures boxbilling'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

depends 'apache2'
depends 'database'
depends 'encrypted_attributes'
depends 'mysql', '~> 5.0'
depends 'openssl'
depends 'php'
depends 'yum-epel'
depends 'ssl_certificate'
