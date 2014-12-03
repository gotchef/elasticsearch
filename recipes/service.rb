#
# Service
#

include_recipe 'runit'

runit_service "elasticsearch" do
	default_logger true
	sv_timeout 180
	env node[:elasticsearch][:env_vars]
	action [:enable, :start] 
end



