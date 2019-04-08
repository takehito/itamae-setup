directory "#{ENV["GOPATH"]}/src/github.com/kelseyhightower"

git "#{ENV["GOPATH"]}/src/github.com/kelseyhightower/confd" do
	repository "https://github.com/kelseyhightower/confd.git"
end

execute "make confd repository" do
	command "make"
	cwd "#{ENV["GOPATH"]}/src/github.com/kelseyhightower/confd"
end
