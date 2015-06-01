
# Usage instructions

- Download Tomcat 8 from <http://apache.mirrors.spacedump.net/tomcat/tomcat-8/v8.0.18/bin/apache-tomcat-8.0.18.tar.gz> and put it into the `repository` directory.
- Build the `petclinic` application (`gradle clean build`) in the `../application/spring-petclinic` directory and place `petclinic-0.1-SNAPSHOT.war` into the `repository` directory.
- Run `vagrant up` to start all the virtual machines.
- Run `gradle initNode` to initialize software needed for provisioning (Puppet) to work.
- Run `gradle puppetapply` to apply Puppet configuration to virtual servers.


