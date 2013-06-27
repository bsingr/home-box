set :application, "home-box"
set :repository,  "./root"

set :scm, :none

default_run_options[:pty] = true
set :use_sudo, false

set :user, 'dpree'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :app, "home.local"

set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :copy


# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do
  task :migrate do
    puts "    not doing migrate because not a Rails application."
  end
  task :finalize_update do
    puts "    not doing finalize_update because not a Rails application."
  end
  task :start do
    puts "    not doing start because not a Rails application."
  end
  task :stop do 
    puts "    not doing stop because not a Rails application."
  end
  task :restart do
    puts "    not doing restart because not a Rails application."
  end

  task :apt do
    run "#{sudo} apt-get update"
    run "#{sudo} apt-get install dnsmasq shorewall hostapd hdparm vim avahi-daemon"
  end
  after "deploy:update", "deploy:apt"

  task :root, roles: :app do
    root_dir = File.join(File.dirname(__FILE__), '..', 'root')
    Dir.glob(File.join(root_dir, '**', '*')).each do |file|
      normalized_file = file.gsub(root_dir, '')
      if File.directory?(file)
        run "#{sudo} mkdir -p #{normalized_file}"
      else
        run "#{sudo} cp #{File.join(current_path, normalized_file)} #{normalized_file}"
      end
    end
  end
  after "deploy:update", "deploy:root"
end
