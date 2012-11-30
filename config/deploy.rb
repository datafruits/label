set :application, "releases.datafruits.fm"
set :repository,  "freedrull@freedrool.us:/opt/git/releases.datafruits.fm.git"

set :user, "freedrull"

 set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "datafruits.fm"                          # Your HTTP server, Apache/etc
role :app, "datafruits.fm"                          # This may be the same as your `Web` server
role :db,  "datafruits.fm", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :update do
    system("middleman build")
    system("rsync -rv build/* freedrull@freedrool.us:/var/www/releases.datafruits.fm/")
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
   #run "#{try_sudo} /etc/rc.d/nginx restart"
  end
end
