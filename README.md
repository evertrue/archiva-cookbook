# archiva cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/archiva.svg?style=flat)](https://supermarket.getchef.com/cookbooks/archiva)
[![Build Status](http://img.shields.io/travis/evertrue/archiva-cookbook.svg?style=flat)](https://travis-ci.org/evertrue/archiva-cookbook)

This cookbook installs [Apache Archiva](http://archiva.apache.org) 2.2.4 standalone.

## Requirements

* `ark`
* `java`
* `nginx`
    - If the `nginx_proxy` recipe is not used, nginx won’t be installed

## Attributes

| Key                           | Type   | Description                             |
| ---                           | ----   | ----------                              |
| `['archiva']['version']`      | string | the version of Archiva to install       |
| `['archiva']['checksum']`     | string | SHA512 checksum used by Ark             |
| `['archiva']['install_path']` | string | Path for Ark to install Archiva to      |
| `['archiva']['home']`         | string | Where Archiva will be upon installation |
| `['archiva']['user_owner']`   | string | Owner of Archiva                        |
| `['archiva']['web_host']`     | string | Hostname for Archiva; used for Nginx    |
| `['archiva']['web_port']`     | string | Port that Archiva listens on            |
| `['archiva']['web_domain']`   | string | Server name used by Nginx               |
| `['archiva']['web_template']` | string | Portion of template filename for Nginx  |
| `['archiva']['nginx']`        | string | The `nginx` cookbook recipe to use      |
| `['archiva']['nginx_uri']`    | string | The Nginx server location               |
| `['archiva']['nginx_port']`   | string | Nginx virtual host listen port          |

## Usage

Either:

* Add `archiva::default` to a node’s run list

Or:

* Add `archiva::nginx_proxy` to a run list to include `archiva::default`, which installs NGINX & sets it to handle proxing requests to Archiva

### Wrapping this cookbook

Should you wish to customize this cookbook’s behavior, the recommendation is to follow The Berkshelf Way and write a wrapper cookbook for this one.

You would then include this cookbook’s recipe(s) in your wrapper cookbook, setting attributes in whatever fashion makes sense for your use case.

E.g.,

```ruby
# attributes/default.rb

override['java']['java_home']   = '/usr/lib/jvm/java-7-openjdk-amd64'
override['java']['java_exec']   = node['java']['java_home'] + '/bin/java'
override['java']['jdk_version'] = '7'

override['archiva']['nginx_uri']   = '/archiva/'
override['archiva']['nginx_port']  = '8080'
override['archiva']['web_host']    = 'localhost'
override['archiva']['web_port']    = '9090'

# recipes/default.rb

include_recipe 'archiva'
include_recipe 'archiva::nginx_proxy'
```

## Contributing

See [CONTRIBUTING.MD](https://github.com/evertrue/archiva-cookbook/blob/master/CONTRIBUTING.md)

## License and Authors

Author:: Jeff Byrnes <thejeffbyrnes@gmail.com>  
Author:: Eric Herot <eric.herot@gmail.com>  
Author:: Ed Hurtig <eddie@hurtigtechnologies.com>  
Author:: Jorge Espada <espada.jorge@gmail.com>  

License:: Apache License v2.0
