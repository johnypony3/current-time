ENV['PATH'] = "/usr/local/bin:#{ENV['PATH']}"
ENV['PASSWORD_STORE_DIR'] = '/Users/edward/.password-store/'

node['brew_packages'].each do |package,properties|
 homebrew_package package do
   version properties[:version]
   homebrew_user (properties[:homebrew_user].nil?) ? node[:homebrew][:homebrew_user] : properties[:homebrew_user]
   action properties[:action]
 end
end

bash 'commit-pass' do
  user 'root'
  code <<-EOH
    sudo su edward
    pass list
    pass bingo
    pass git push
    EOH
end
