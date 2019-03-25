http_request "/tmp/drone_linux_amd64.tar.gz" do
	url "https://github.com/drone/drone-cli/releases/download/v1.0.7/drone_linux_amd64.tar.gz"
	not_if "test -e /tmp/drone_linux_amd64.tar.gz"
end

execute "expand tar file" do
	command "tar -zxf /tmp/drone_linux_amd64.tar.gz -C /tmp"
	user "root"
	only_if "test -e /tmp/drone_linux_amd64.tar.gz"
	not_if "test -e /tmp/drone"
end

execute "install drone-cli" do
	command "install -t /usr/local/bin /tmp/drone"
	user "root"
	only_if "test -e /tmp/drone"
end
