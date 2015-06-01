
class application(
  $tomcat_source_url = 'http://192.168.48.30/apache-tomcat-8.0.18.tar.gz',
  $app_location      = 'http://192.168.48.30/petclinic-0.1-SNAPSHOT.war',
  $vhost_name        = 'local.petclinic.gr8conf.org',
  $db_host           = '', 
  $db_schema_name    = 'petclinic',
  $db_user           = 'petclinic',
  $db_password       = 'petclinic',
) {

  class { 'java' : } ->
  class { 'tomcat': } ->

  tomcat::instance{ 'default':
    source_url => $tomcat_source_url  
  } ->  

  tomcat::service { 'default':
    use_jsvc      => false,
    use_init      => false,
    service_name  => 'tomcat',
  } ->

  tomcat::war { 'petclinic.war':
    war_source    => $app_location,
  }

  class { 'nginx': }
  
  nginx::resource::upstream { 'petclinic_tomcat':
    members       => [
      "localhost:8080"
    ],
  }

  nginx::resource::vhost { $vhost_name:
    proxy         => 'http://petclinic_tomcat',
  }
  
  # TODO:
  # file { '/opt/apache-tomcat/webapps/petclinic/WEB-INF/classes/spring/data-access.properties':
  #   
  # }
    
}