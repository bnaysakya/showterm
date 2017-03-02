# config valid only for current version of Capistrano
lock "3.7.2"
set :application, "showterm"
set :repo_url, "git@github.com:bnaysakya/showterm.git"
set :keep_releases, 3
set :deploy_to,"/home/binayshakya/project/#{fetch(:application)}"
set :chruby_ruby, "ruby-2.2.2"
# set :chruby_map_bins, fetch(:chruby_map_bins, []).concat(%w{ rails })
# set :bundle_bins, fetch(:bundle_bins, []).concat(%w{ rails })
#set :chruby_ruby, File.read('.ruby-version').match(/\S*/).to_s # Defaults to: 'default'
namespace :deploy do
  task :start do
    on "localhost" do
       #execute "exec /home/binayshakya/.gem/ruby/2.2.2/bin/rails s"
       #execute "cd /home/binayshakya/project/#{fetch(:application)}/current && /home/binayshakya/.gem/ruby/2.2.2/bin/rails s"
       #execute "ruby -version"
       #execute "source /usr/local/share/chruby/chruby.sh && chruby 2.2.2 && ruby -version"
       execute "source /usr/local/share/chruby/chruby.sh && cd /home/binayshakya/project/#{fetch(:application)}/current && chruby 2.2.2 &&
       ruby -v && rails s"
    end
  end
end
set :pty, true
after 'deploy:finishing', 'deploy:start'
