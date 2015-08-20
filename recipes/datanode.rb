#
# Data Node Recipe
#
node.override[:elasticsearch][:node][:master] = false
node.override[:elasticsearch][:http][:enabled] = false
node.override[:elasticsearch][:node][:data] = true

include_recipe 'elasticsearch-cave::install'
