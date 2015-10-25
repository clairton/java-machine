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
    yum install -y gcc-c++ make git

    #install node
    curl --silent --location https://rpm.nodesource.com/setup | bash -
    yum install -y nodejs
    #update node to lastest version
    npm cache clean -f
    npm install -g n
    n stable

    #maven
    wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
    yum install -y apache-maven

    #install java after maven
    yum install -y java-1.8.0-openjdk-devel.x86_64

    update-alternatives --set java /usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin/java
    update-alternatives --set javac /usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin/javac

    #usuario para wilfly
    #useradd --system \ --comment "WildFly Application Server" \ --create-home --home /opt/wildfly \ --user-group wildfly
  SHELL
end
