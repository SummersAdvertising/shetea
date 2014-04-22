# encoding: utf-8
set :stage, :production
set :deploy_to, '/var/spool/RoR-Projects/shetea/'


# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{apps@li406-49.members.linode.com}
role :web, %w{apps@li406-49.members.linode.com}
role :db,  %w{apps@li406-49.members.linode.com}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'li406-49.members.linode.com', user: 'apps', roles: %w{web app}


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
desc "Create database.yml and asset packages for production"
before "deploy:finishing", :set_database do
	on roles( :app ), in: :sequence do		
		execute :cp, "#{shared_path}/config/database.yml.production #{release_path}/config/database.yml"
		# execute :mkdir, "#{release_path}/config/environments"
		# execute :cp, "#{shared_path}/config/environment.rb.production #{release_path}/config/environments/production.rb"
		
		within current_path do
			execute :bundle, "install --deployment"
			execute :rake, "assets:precompile RAILS_ENV=production"
		end
	end
end