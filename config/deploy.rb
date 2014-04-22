# config valid only for Capistrano 3.1
lock '3.2.0'

set :application, 'shetea'
set :repo_url, 'git@github.com:SummersAdvertising/shetea.git'

set :keep_releases, 5

SSHKit.config.command_map[:rake] = "bundle exec rake"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :mkdir, release_path.join('tmp')
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, 'build:upload_folder' do
    on roles( :app ), in: :sequence do
      within release_path do
      execute :ln, " -s  #{shared_path}/uploads/ #{release_path}/public/uploads"
    end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
