remote_file "/etc/nginx/sites-available/state-of-use" do
	user "root"
	mode "0644"
	owner "root"
	group "root"
end

link "/etc/nginx/sites-enabled/state-of-use" do
	user "root"
	to "/etc/nginx/sites-available/state-of-use"
end

service "nginx" do
	action :restart
end
