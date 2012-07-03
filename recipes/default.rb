require_recipe "git"

git node[:nvm][:dir] do
  repository node[:nvm][:repository] #fork
  reference node[:nvm][:version]
  action :sync
end

execute ". #{node[:nvm][:dir]}/nvm.sh"
node[:nvm][:nodejs_versions].each do |version|
	execute "nvm install #{version}"
end