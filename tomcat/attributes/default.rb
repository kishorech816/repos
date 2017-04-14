#  Attributes: dafault

# RHEL 6 Tomcat 7

default['system']['user'] = 'root'
default['system']['group'] = 'root'
default['bcd_tomcat']['user'] = 'sysBCDjenkins'
default['bcd_tomcat']['group'] = 'uGLBBCDsysacts'
default['bcd_tomcat']['root'] = '/apps/bwed'
default['bcd_tomcat']['home'] = "#{node['bcd_tomcat']['root']}/home"
default['bcd_tomcat']['tools'] = "#{node['bcd_tomcat']['root']}/tools"
default['bcd_tomcat']['java'] = "#{node['bcd_tomcat']['root']}/java"
default['bcd_tomcat']['name'] = 'apache-tomcat-7.0.50'
default['bcd_tomcat']['location'] = "#{node['bcd_tomcat']['root']}/tomcat"
default['bcd_tomcat']['package'] = 'apache-tomcat-7.0.77.tar.gz'
default['bcd_tomcat']['source'] = 'http://redrockdigimark.com/apachemirror/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz'
default['bcd_java']['name'] = 'jdk1.8.0_111'
default['bcd_java']['location'] = "#{node['bcd_tomcat']['java']}/jdk1.8.0_111"
default['bcd_java']['package'] = 'jdk1.8.0_111.tar.gz'
default['bcd_java']['source'] = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/jdk-1.8.0_111.tar.gz'