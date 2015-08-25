Vagrant.configure('2') do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = ENV["DIGITAL_OCEAN_SSH_PRIVATE_KEY_PATH"]
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.ssh.username = 'vagrant'
    provider.ssh_key_name = ENV["DIGITAL_OCEAN_SSH_KEY_NAME"]
    provider.token = ENV["DIGITAL_OCEAN_API_KEY"]
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'sgp1'
    provider.size = '512mb'
    provider.setup = true
  end

  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.synced_folder "./result/", "/vagrant/result/", type: "rsync_pull"

end
