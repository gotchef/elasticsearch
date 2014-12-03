#
# elasticsearch::env.rb - environmental variables
#

es_home = "#{node.elasticsearch[:dir]}/elasticsearch"

default[:elasticsearch][:env_vars] = {
	"ES_HOME=" => "#{es_home}",
	"ES_CLASSPATH" => "$ES_CLASSPATH:#{es_home}/lib/*:#{es_home}/lib/sigar/*",
	"ES_HEAP_SIZE" => "#{node.elasticsearch[:allocated_memory]}",
	"ES_JAVA_OPTS" => " -server -Djava.net.preferIPv4Stack=true 
	-Des.config=#{node.elasticsearch[:path][:conf]}/elasticsearch.yml
  -Xms#{node.elasticsearch[:allocated_memory]}
  -Xmx#{node.elasticsearch[:allocated_memory]}
  -Xss#{node.elasticsearch[:thread_stack_size]}
  #{node.elasticsearch[:gc_settings]}
  #{node.elasticsearch[:env_options]}"
}
#
#<% if node.elasticsearch[:jmx] %>
#  -Dcom.sun.management.jmxremote.ssl=false
#  -Dcom.sun.management.jmxremote.authenticate=false
#  -Dcom.sun.management.jmxremote.port=3333
#  -Djava.rmi.server.hostname=<%= node[:ipaddress] %>
#<% end %>

