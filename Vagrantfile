Vagrant.configure(2) do |config|
  config.vm.box = 'puppetlabs/centos-6.6-64-puppet'

  #config.vm.network 'forwarded_port', guest: 8080, host: 8081
  #config.vm.network 'forwarded_port', guest: 9990, host: 9990
  #config.vm.network 'forwarded_port', guest: 5432, host: 5432
  #config.vm.network 'forwarded_port', guest: 4200, host: 4200

  config.vm.network 'private_network', ip: '127.0.0.2'

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

    #add repository and install node
    curl --silent --location https://rpm.nodesource.com/setup | bash -
    yum install -y nodejs

    #update node to lastest version
    npm cache clean -f
    npm install -g n
    n stable

    #maven repository
    wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
    yum install -y apache-maven

    #install java after maven
    yum install -y java-1.8.0-openjdk-devel.x86_64

    #update PATH do use java 8
    update-alternatives --set java /usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin/java
    update-alternatives --set javac /usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin/javac

    #postgresql 9.4
    yum -y install http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-redhat94-9.4-2.noarch.rpm
    yum -y install postgresql94-server postgresql94-contrib
    service postgresql-9.4 initdb
    chkconfig postgresql-9.4 on
    #Create data base
    #psql -h localhost -p 5432 -U postgres -W postgres << EOF
    #  CREATE DATABASE test;
    #EOF

    #jboss as
    wget http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.zip
    unzip wildfly-8.2.0.Final.zip -d /opt/
    ln -s /opt/wildfly-8.2.0.Final /opt/wildfly
    cp /opt/wildfly/bin/init.d/wildfly.conf /etc/default/wildfly.conf
    cp /opt/wildfly/bin/init.d/wildfly-init-redhat.sh /etc/init.d/wildfly
    chkconfig --add wildfly
    chkconfig wildfly on
    mkdir -p /var/log/wildfly
    adduser wildfly
    chown -R wildfly:wildfly /opt/wildfly-8.2.0.Final
    chown -R wildfly:wildfly /opt/wildfly
    chown -R wildfly:wildfly /var/log/wildfly
    chown -R wildfly:wildfly /var/run/wildfly
    service wildfly start
  SHELL
end
