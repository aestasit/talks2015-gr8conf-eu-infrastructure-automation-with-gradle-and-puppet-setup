

class repository {

  class { 'nginx': }
  
  nginx::resource::vhost { 'default':
    www_root         => '/repository',
    autoindex        => 'on'
  }

}