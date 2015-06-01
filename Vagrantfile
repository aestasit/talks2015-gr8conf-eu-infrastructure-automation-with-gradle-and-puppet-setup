Vagrant.configure(2) do |config|
  config.vm.box = "puphpet/ubuntu1404-x64"
  config.vm.define "repo" do |repo|
    repo.vm.hostname = "repository.gr8conf.org"
    repo.vm.network :private_network, ip: "192.168.48.30"
    repo.vm.synced_folder "repository/", "/repository"
  end
  config.vm.define "application" do |app|
    app.vm.hostname = "application.gr8conf.org"
    app.vm.network :private_network, ip: "192.168.48.10"
  end
  config.vm.define "database" do |db|
    db.vm.hostname = "database.gr8conf.org"
    db.vm.network :private_network, ip: "192.168.48.20"
  end
end
