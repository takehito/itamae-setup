GO_VER = "1.12.1"
OS = "linux"
ARCH = "amd64"

http_request "/tmp/go#{GO_VER}.#{OS}-#{ARCH}.tar.gz" do 
	url "https://dl.google.com/go/go#{GO_VER}.#{OS}-#{ARCH}.tar.gz"
end

execute "expand tar file" do
	command "tar -C /usr/local -xzf go#{GO_VER}.#{OS}-#{ARCH}.tar.gz"
	user "root"
	cwd "/tmp"
end
