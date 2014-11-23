namespace :database do

  desc "Makes a symbolic link to the shared database.yml"
  task :link_config, :except => { :no_release => true } do
    run "ln -sf #{shared_path}/database.yml #{release_path}/config/database.yml"
  end

  desc "Populate the database with initial set"
  task :seed do
    run "cd #{current_path} && bundle exec rake RAILS_ENV=#{rails_env} db:seed"
  end

  desc "Clear sessions from database on deploy"
  task :clear_sessions do
    run "cd #{current_path} && bundle exec rake db:sessions:clear RAILS_ENV=#{rails_env}"
  end
end
