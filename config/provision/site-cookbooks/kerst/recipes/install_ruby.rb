include_recipe "ruby_build"

ruby_build_ruby node[:ruby_version] do
  action :reinstall
  prefix_path "/usr/local"
end

gem_package "bundler"
