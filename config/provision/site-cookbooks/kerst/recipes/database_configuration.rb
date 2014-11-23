template "#{node[:directories][:shared_config_path]}/database.yml" do
  owner node[:user]

  source "database.yml.erb"
  variables({
    :database_name     => node[:database_name],
    :database_password => node[:database_password],
    :database_user     => node[:database_user],
    :database_host     => node[:database_host]
  })
end

