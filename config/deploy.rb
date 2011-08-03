$:.unshift(File.expand_path('./lib',ENV['rvm_path']))

require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "hello_sinatra"
set :repository,  "git://github.com/arunsark/hello_sinatra.git"
set :branch, "develop"

set :scm, :git
set :user, "hello_sinatra.com"
set :deploy_to, "/home/hello_sinatra.com/apps/#{application}"
set :use_sudo, false
set :keep_releases, 5
set :rvm_type, :system
set :rvm_bin_path, '/usr/local/rvm/bin'

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
set :port, 2200
#role :db,  "your slave db-server here"


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

after "bundle:install"
