archiva CHANGELOG
======================
This is the changelog for the archiva cookbook.

v3.0.0 (2019-10-25)
-------------------
* Set default Archiva version to 2.2.4
* Upgrade `apt` to v7.x
* Upgrade `java` cookbook to v4.x
* Upgrade `chef_nginx` cookbook to `nginx` v10.x & adjust `archiva::nginx_proxy` to suit
* Update default attribute value to install Java 8
    - On Debian >= 10.0, it will install Java 11, as that’s what’s available
* Drop AWS-based testing in favor of Docker-based testing
* Drop support for Ubuntu 12.04 & 14.04, and Debian 7
* Add support for Ubuntu 16.04, Ubuntu 18.04, Debian 9, & Debian 10
* Drop Coveralls from unit tests

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
