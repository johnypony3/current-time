ENV['PATH'] = "/usr/local/bin:/usr/local/sbin/:#{ENV['PATH']}"
ENV['PASSWORD_STORE_DIR'] = '/Users/edward/.password-store/'

node['brew_packages'].each do |package,properties|
 homebrew_package package do
   version properties[:version]
   homebrew_user (properties[:homebrew_user].nil?) ? node[:homebrew][:homebrew_user] : properties[:homebrew_user]
   action properties[:action]
 end
end

bash 'commit-pass' do
  action :nothing
  user 'root'
  code <<-EOH
    sudo su edward
    pass git push
    EOH
end

cookbook_file "#{node[:user][:home]}/.config/minidlna/restart.sh" do
  source 'restart.sh'
  owner node[:homebrew][:homebrew_user]
  group 'staff'
  mode '0644'
  action :create
end

cookbook_file "#{node[:user][:home]}/.config/minidlna/minidlna.conf" do
  source 'minidlna.conf'
  owner node[:homebrew][:homebrew_user]
  group 'staff'
  mode '0644'
  action :create
end

bash 'restart-dlnaserver' do
  cwd "#{node[:user][:home]}/.config/minidlna"
  user 'root'
  code <<-EOH
    sudo bash restart.sh
    EOH
end
