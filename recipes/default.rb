#
# elasticsearch::default
#
#

include_recipe 'elasticsearch::install'
include_recipe 'elasticsearch::configure'
include_recipe 'elasticsearch::service'
