# INTRODUCTION 
# /etc/manifest/site.pp is the first file that, by default, the PuppetMaster
# loads if you don't use an ENC.
#
# Here you find a sample layout of a Puppet infrastructure based on the Example42 modules
# We import explicitely various manifests classes placed in /etc/manifests/
# and modules that can't be autoloaded from your modulepath ( /etc/puppet/modules )

# GENERAL IMPORTS AND RESOURCE DEFAULTS
# Example42 common module (contains defines used by other modules that can't autoload)
# This is kept for backwards compatibility with some modules
# import "common"

# This is the module that contains our customizations:
# - Our custom roles and baselines, included by the nodes
# - Our custom classes, autoloaded in $myproject is set to lab42
# - Our templates and configuration files
#import "example42" 

import "projects/*.pp"

# General settings for standard types
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }

# TOP SCOPE VARIABLES
# Here are valuated all the variables you may want to use to affect module's behaviour



# NODES DEFINITIONS
# Can be splitted in different files to be imported here
#node 'puppet.example42.com' inherits basenode {
#  include example42::role::puppet
#}

#node /^foreman\.*/ inherits basenode {
#  include example42::role::foreman
#}

#node /^web\d+$/ inherits basenode {
#  include example42::role::web
#}

#node /^test\.*/ inherits basenode {
#  include example42::role::test
#}

#node /^rspec\.*/ inherits basenode {
#  include example42::role::rspec
#}


#node /^moon\.*/ inherits basenode {
#  include example42::role::ci
#}

# :include:README.rdoc
# :main:__site__::readme
class readme {}

