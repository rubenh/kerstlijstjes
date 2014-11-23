include_recipe 'git'

package "postfix"

# Install Ruby shadow for working with Unix password
gem_package 'ruby-shadow'

# Create groups and users
group node[:group] do
end

user node[:user] do
  gid node[:group]
  password node[:user_password]
  home "/home/#{node[:user]}"
    shell '/bin/bash'
  supports(manage_home: true)
end

# NOTE: Added user to the admin group to allow passwordless sudo
group 'admin' do
  action :create
  members node[:user]
  append true
end

# Create directories for Capistrano and Apache.
node[:directories].each do |key, directory|
  directory directory do
    owner node[:user]
    group node[:group]
    mode '0755'
    recursive true
  end
end

# %w(mail.yml).each do |file|
#   cookbook_file File.join(node[:directories][:shared_config_path], file) do
#     source [ node[:stage], file ].join('-')
#     owner node[:user]
#     group "www-data"
#     mode "0644"
#   end
# end
