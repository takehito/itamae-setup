node[:network_manager][:interface].each do |interface|

	execute "add network interface" do
		user "root"
		command "nmcli con add type #{interface[:type]} ifname #{interface[:name]} mode #{interface[:mode]}"
	end

	if interface.has_key?(:slave)
		interface[:slave].each do |slave|

			execute "add slave connection" do
				user "root"
				command "nmcli con add type #{interface[:type]} con-name #{slave[:con_name]} ifname #{slave[:ifname]} master #{interface[:name]}"
			end
		
		end 
	end

end

service "network-manager" do
	action :restart
	user "root"
end
