include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_deflate"
include_recipe "apache2::mod_headers"

apache_module "expires"
apache_module "include"

def apache_conf_template
  "apache.conf.erb"
end

apache_conf = apache_conf_template

template "/etc/apache2/sites-available/#{node[:url]}" do
  owner "root"
  group "root"
  source apache_conf
  variables({
    :url => node[:url],
    :public => node[:apache][:public]
  })
end

link "/etc/apache2/sites-enabled/#{node[:url]}" do
  to "/etc/apache2/sites-available/#{node[:url]}"
end
