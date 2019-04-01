if node[:nginx].has_key(:sites_availables) then
	sites_enables = node[:nginx][:sites_availables]
else 
	raise "set node infomation for sites_availables"
end

if node[:nginx].has_key(:sites_enabled) then
	sites_enables = node[:nginx][:sites_enabled]
else 
	raise "set node infomation for sites_enabled"
end

node[:nginx][:sites_available][:files].each do |file|
	remote_file "/etc/nginx/sites-available/#{file[:name]}" do
		user "root"
		mode "0644"
		owner "root"
		group "root"
		source "/etc/nginx/sites-available"
	end
end

node[:nginx][:sites_enabled][:files].each do |file|
	link "/etc/nginx/sites-enabled/#{file[:name]}" do
		user "root"
		to "/etc/nginx/sites-available/#{file[:name]}"
	end
end

service "nginx" do
	action :restart
end
