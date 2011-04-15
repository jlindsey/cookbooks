#
# Cookbook Name:: joshualindsey.net
# Recipe:: default
#
# Copyright 2011, Joshua Lindsey.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cookbook_file "/etc/nginx/sites-enabled/default" do
  source "site.conf"
  mode "0644"
  owner "root"
  group "root"
  backup 2
  notifies :restart, 'service[nginx]'
end

service 'nginx'

directory "/srv/www" do
  owner "ubuntu"
  group "ubuntu"
  mode "0755"
end

git "/srv/www/site" do
  repository "git://github.com/jlindsey/jlindsey.github.com.git"
  reference "master"
  user "ubuntu"
  group "ubuntu"
  action :sync
end

git "/srv/www/blog" do
  repository "git://github.com/jlindsey/blog.git"
  reference "master"
  user "ubuntu"
  group "ubuntu"
  action :sync
end

