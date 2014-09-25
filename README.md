# archiva cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/archiva.svg?style=flat)](https://supermarket.getchef.com/cookbooks/archiva)
[![Build Status](http://img.shields.io/travis/jespada/chef-archiva.svg?style=flat)](https://travis-ci.org/jespada/chef-archiva)
[![Coverage Status](https://img.shields.io/coveralls/jespada/chef-archiva.svg?style=flat)](https://coveralls.io/r/jespada/chef-archiva?branch=master)

This cookbook installs [Apache Archiva](http://archiva.apache.org) 2.1.1 standalone.

## Requirements

* `ark`
* `java`
* `nginx`
    - If the nginx_proxy recipe is not used, nginx won’t be installed

## Attributes

<table>
    <tr>
        <th>Key</th>
        <th>Type</th>
        <th>Description</th>
        <th>Default</th>
    </tr>

    <tr>
      <td><code>[:archiva][:version]</code></td>
      <td>string</td>
      <td>the version of Archiva to install</td>
      <td><code>2.1.1</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:checksum]</code></td>
        <td>string</td>
        <td>SHA512 checksum used by Ark</td>
        <td><code>b517a93c8e1d5825adb738d091c8a55b9bcfd0200286d9c403b58f88a67c4aab</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:install_path]</code></td>
        <td>string</td>
        <td>Path for Ark to install Archiva to</td>
        <td><code>/opt/</code></tr>
    </td>

    <tr>
        <td><code>[:archiva][:home]</code></td>
        <td>string</td>
        <td>Where Archiva will be upon installation</td>
        <td><code>/opt/archiva</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:user_owner]</code></td>
        <td>string</td>
        <td>Owner of Archiva</td>
        <td><code>root</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:web_host]</code></td>
        <td>string</td>
        <td>Hostname for Archiva; used for Nginx</td>
        <td><code>127.0.0.1</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:web_port]</code></td>
        <td>string</td>
        <td>Port that Archiva listens on</td>
        <td><code>8080</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:web_domain]</code></td>
        <td>string</td>
        <td>Server name used by Nginx</td>
        <td><code>archiva.example.com</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:web_template]</code></td>
        <td>string</td>
        <td>Portion of template filename for Nginx</td>
        <td><code>default</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:nginx]</code></td>
        <td>string</td>
        <td>The <code>nginx</code> cookbook recipe to use</td>
        <td><code>default</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:nginx_uri]</code></td>
        <td>string</td>
        <td>The Nginx server location</td>
        <td><code>/</code></td>
    </tr>

    <tr>
        <td><code>[:archiva][:nginx_port]</code></td>
        <td>string</td>
        <td>Nginx virtual host listen port</td>
        <td><code>80</code></td>
    </tr>
</table>

## Usage

* Add `archiva::default` to a node’s run list
* Add `archiva::nginx_proxy` to a run list to include `archiva::default`, then install Nginx & have it handle proxing requests to Archiva

### Wrapping this cookbook

Should you wish to customize this cookbook’s behavior, the recommendation is to follow The Berkshelf Way and write a wrapper cookbook for this one.

You would then include this cookbook’s recipe(s) in your wrapper cookbook, setting attributes in whatever fashion makes sense for your use case.

E.g.,

```ruby
    # attributes/default.rb

    set[:java][:java_home]   = '/usr/lib/jvm/java-7-openjdk-amd64'
    set[:java][:java_exec]   = node[:java][:java_home] + '/bin/java'
    set[:java][:jdk_version] = '7'

    set[:archiva][:nginx_uri]   = '/archiva/'
    set[:archiva][:nginx_port]  = '8080'
    set[:archiva][:web_host]    = 'localhost'
    set[:archiva][:web_port]    = '9090'

    # recipes/default.rb

    include_recipe 'archiva'
    include_recipe 'archiva::nginx_proxy'
```
