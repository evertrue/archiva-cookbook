archiva CHANGELOG
======================
This is the changelog for the archiva cookbook.

v3.0.1 (2019-10-21)
* Bumped to version 3.01
* Set nginx log path (defaults to /)

v3.0.0 (2019-10-17)
* Bumped to version 3.0.0
* Install Archiva 2.2.4
* Added support for Ubuntu 16.04, 18.04 and Debian 9
* Removed support for Ubuntu 12,04, 14.04 and Debian 7
* Replaced chef_nginx cookbook with nginx (v 10.0.1)
* Updated apt to v7.2.0
* Updated ark to v4.0.0
* Updated java to v4.3.0
* Removed coveralls
* Accept chef license in .kitchen.yml

v2.0.0 (2017-03-13)
-------------------
* Bump `chef_nginx` to v5

v1.2.0 (2016-09-26)
-------------------
* Use chef_nginx instead of nginx

v1.1.0 (2016-03-21)
-------------------
* Add `node[:archiva][:mirror]` attribute to allow operator to customize where Archiva is downloaded from
* Refactor test harness to work well in Travis & do integration testing

v1.0.1 (2015-03-13)
-------------------
* Reload nginx when archiva_server.conf changes

v1.0.0 (2014-09-24)
-------------------
* Refactored to install Archiva ≥ 2.1.1
* Fixed up metadata
* Added Berkshelf support
* Added ChefSpec unit tests
* Added Test Kitchen
* Added ServerSpec integration tests
* Wired up to Travis CI for all tests
* Wired up to Coveralls.io for unit test coverage

v0.0.1 (2014-01-10)
-------------------
* Initial rev
