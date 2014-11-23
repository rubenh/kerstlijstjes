execute "set mysql root password" do
  command "mysqladmin -u root password '#{node[:database_root_password]}'"
  only_if "mysql -u root -e 'show databases' > /dev/null"
end

mysql "create database" do
  password node[:database_root_password]
  query "CREATE DATABASE IF NOT EXISTS #{node[:database_name]}"
end

mysql "create user" do
  password node[:database_root_password]
  query "GRANT ALL ON #{node[:database_name]}.* TO '#{node[:database_user]}'@'localhost' IDENTIFIED BY '#{node[:database_password]}'"
end
