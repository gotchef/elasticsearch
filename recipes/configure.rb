#
# elasticsearch::configure
#

include_recipe 'runit'

runit_service "elasticsearch" do
  supports :status => true, :restart => true
  action [ :enable ]
end

# Create ES config file
#
template "elasticsearch.yml" do
  path   "#{node.elasticsearch[:path][:conf]}/elasticsearch.yml"
  source node.elasticsearch[:templates][:elasticsearch_yml]
  owner  node.elasticsearch[:user] and group node.elasticsearch[:user] and mode 0755

  notifies :restart, 'runit_service[elasticsearch]' unless node.elasticsearch[:skip_restart]
end

# Create ES logging file
#
template "logging.yml" do
  path   "#{node.elasticsearch[:path][:conf]}/logging.yml"
  source node.elasticsearch[:templates][:logging_yml]
  owner  node.elasticsearch[:user] and group node.elasticsearch[:user] and mode 0755

  notifies :restart, 'runit_service[elasticsearch]' unless node.elasticsearch[:skip_restart]
end
