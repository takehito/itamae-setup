package 'fish' do
	action :install
	user "root"
end

execute 'change login shell to fish' do
	command "chsh -s /usr/bin/fish"
	user "heguser"
end
