Description
===========
- This cookbook install Apache Archiva 1.3.9 stand alone (http://archiva.apache.org)
- The instalation will use the defautl internal derby DB
- Source : https://github.com/jespada/chef-archiva

Requirements
============
- Depends on ark cookbook
- Depends on Java cookbook
- Tested on debian 6

Attributes
==========
- You can read the explanation of each one in attributes/default.rb


Usage
=====
- Just add the default cookbook to the node run list and you will have Archiva installed, with no web proxy
- The best way to use this cookbook is trough a role like:

  #Role archiva


           name "archiva"

           description "install and configure archiva with the internal derby DB"

           run_list(
                   "recipe[java]",
                   "recipe[archiva]",
                   "recipe[archiva::nginx_proxy]"
           )

           default_attributes(
                "java" => {
                       "install_flavor" => "oracle"
                       },
                 "archiva" => {
                           "nginx" => "source",
                           "nginx_uri" => "/archiva/",
                           "nginx_port" => "82",
                           "web_host" => "127.0.0.1",
                           "web_port" => "8081"
                           }
           )
