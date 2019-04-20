default[:homebrew][:homebrew_user] = 'edward'

default[:brew_packages] = {
 "jmeter" => {'version' => '5.1.1', 'action' => :install},
 'pass' => {'version' => '1.7.3', 'action' => :install},
 'gpg' => {'version' => '2.2.15', 'action' => :install},
}
