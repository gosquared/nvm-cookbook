git node[:nvm][:dir] do
  repository node[:nvm][:repository]
  reference node[:nvm][:version]
  group "nvm"
  action :sync
end

node[:nvm][:nodejs_versions].each do |version|
	bash "Installing Node.JS #{version}" do
		code ". #{node[:nvm][:dir]}/nvm.sh && nvm install #{version}"
	end
end

execute "chmod -R g+w #{node[:nvm][:dir]}"