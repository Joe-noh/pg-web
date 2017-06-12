# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "pg-web"
set :repo_url, "git@github.com:Joe-noh/pg-web.git"

set :rbenv_type, :user
set :rbenv_ruby, '2.3.3'

set :rbenv_path, "/home/joe/.anyenv/envs/rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} "
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :sidekiq_config, "#{current_path}/config/sidekiq.yml"

set :deploy_to, "/home/joe/pg-web"

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
set :default_env, { path: "$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5
