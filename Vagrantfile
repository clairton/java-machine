Vagrant.configure(2) do |config|
  config.vm.box = 'puppetlabs/centos-6.6-64-puppet'


  #config.vm.define :web do |web_config|
    #web_config.vm.network 'private_network', ip: '192.168.50.10'
    #web_config.vm.network 'forwarded_port', guest: 8080, host: 8080
    #web_config.vm.network 'forwarded_port', guest: 9990, host: 9990
    #web_config.vm.network 'forwarded_port', guest: 4200, host: 4200
    #web_config.vm.network 'forwarded_port', guest: 5432, host: 5432

    #web_config.vm.network 'private_network', ip: '127.0.0.2'
  #end



  config.vm.provision 'shell', inline: <<-SHELL
    yum install -y gcc-c++ make
    curl --silent --location https://rpm.nodesource.com/setup | bash -
    yum install -y git java-1.8.0-openjdk-devel.x86_64 nodejs
  SHELL
end
