want_packages = %w[
    apt-transport-https
    ca-certificates
    curl
    gnupg-agent
    software-properties-common
]

want_packages.each do |want_package|
	package want_package do
		user "root"
	end
end

docker_apt_key_dir = "/tmp/download.docker.com/linux/ubuntu/gpg/"

directory docker_apt_key_dir

http_request "#{docker_apt_key_dir}apt_key" do
	url "https://download.docker.com/linux/ubuntu/gpg"
end

execute "apt-key add" do
	command "apt-key add #{docker_apt_key_dir}/apt_key"
	user "root"
end

execute "docker fingerprint" do
	command "apt-key fingerprint 0EBFCD88"
	user "root"
end

execute "add apt repository" do
	command "add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'"
	user "root"
end

docker_packages = %w[
	docker-ce
	docker-ce-cli
	containerd.io
]

docker_packages.each do |docker_package|
	package docker_package do
		user "root"
	end
end
