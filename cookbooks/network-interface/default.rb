node[:network_manager][:connection].each do |connection|

	execute "add network connection" do
		user "root"
		command "nmcli con add type #{connection[:type]} ifname #{connection[:name]} mode #{connection[:mode]}"
	end

	if connection.has_key?(:ipv4) or 
		connection.has_key?(:autoconnect) then
		execute "modify network connection" do
			user "root"
			command "nmcli con mod "
		end
	end

	if connection.has_key?(:slave)
		connection[:slave].each do |slave|

			execute "add slave connection" do
				user "root"
				command "nmcli con add type #{connection[:type]} con-name #{slave[:con_name]} ifname #{slave[:ifname]} master #{connection[:name]}"
			end
		
		end 
	end

end

service "network-manager" do
	action :restart
	user "root"
end
