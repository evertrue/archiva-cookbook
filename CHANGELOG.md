archiva CHANGELOG
======================
This is the changelog for the archiva cookbook.

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
* Addded Berkshelf support
* Added ChefSpec unit tests
* Added Test Kitchen
* Added ServerSpec integration tests
* Wired up to Travis CI for all tests
* Wired up to Coveralls.io for unit test coverage

v0.0.1 (2014-01-10)
-------------------
* Initial rev
