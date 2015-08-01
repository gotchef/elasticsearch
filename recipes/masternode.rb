#
# Master Node Recipe
#

node.override[:elasticsearch][:node][:master] = true
node.override[:elasticsearch][:node][:data] = false

node.normal.elasticsearch['plugins']['lukas-vlcek/bigdesk/2.5.0'] = {}

include_recipe 'elasticsearch-cave::install'
