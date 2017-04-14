#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory node['bcd_tomcat']['root'] do
 owner node['bcd_tomcat']['user']
 group node['bcd_tomcat']['group']
 mode '0755'
 recursive true
 action :create
end

directory node['bcd_tomcat']['home'] do
 owner node['bcd_tomcat']['user']
 group node['bcd_tomcat']['group']
 mode '0755'
 recursive true
 action :create
end

directory node['bcd_tomcat']['tools'] do
 owner node['bcd_tomcat']['user']
 group node['bcd_tomcat']['group']
 mode '0755'
 recursive true
 action :create
end

directory node['bcd_tomcat']['java'] do
 owner node['bcd_tomcat']['user']
 group node['bcd_tomcat']['group']
 mode '0755'
 recursive true
 action :create
end

directory node['bcd_tomcat']['location'] do
 owner node['bcd_tomcat']['user']
 group node['bcd_tomcat']['group']
 mode '0755'
 recursive true
 action :create
end

remote_file "#{Chef::Config['file_catch_path']}/java.tar.gz" do
 source node['bcd_java']['source']
 owner node['system']['user']
 group node['system']['group']
 action :create
end

execute 'install_java' do
 command "tar zxf #{Chef::Config['file_catch_path']}/java.tar.gz" do
 cwd ['bcd_java']['java']
end

remote_file "#{Chef::Config['file_catch_path']}/tomcat.tar.gz"
 source node['bcd_tomcat']['source']
 owner node['system']['user']
 group node['system']['group']
 action :create
end

execute 'install_tomcat' do
 command "tar zxf #{Chef::Config['file_catch_path']}/tomcat.tar.gz"
 cwd node['bcd_tomcat']['root']
 not_if { ::File.exist?("#{node['bcd_tomcat']['location']}/bin/catalina.sh")}
end 

execute 'rename_tomcat' do
 command "mv #{node['bcd_tomcat']['root']}/apache-tomcat-7.0.77 #{node['bcd_tomcat']['location']}"
 not_if { ::File.exist?("#{node['bcd_tomcat']['location']}/bin/catalina.sh")}
end

template 'tomcat' do
 path '/etc/init.d/tomcat'
 source 'init.d/tomcat'
 owner node['bcd_tomcat']['user']
 group node['bcd_tomcat']['group']
 node '0755'
end

execute 'set_permission' do
 command "chown -R #{node['bcd_tomcat']['user']}:#{node['bcd_tomcat']['group']} #{node['bcd_tomcat']['root']}"
end

service 'tomcat' do
 supports status: true, start: true, restart: true
 action [:enable, :start]
 subscribes :start, 'template[tomcat]', :immediately
end