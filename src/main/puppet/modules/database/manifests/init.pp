
class database(
  $db_root_password = 'secret',
  $db_schema_name   = 'petclinic',
  $db_user          = 'petclinic',
  $db_password      = 'petclinic',
  $app_host         = '127.0.0.1'
) {

  class { '::mysql::server':
    root_password      => $db_root_password,
    override_options   => {
      'mysqld'         => {
        'bind_address' => '0.0.0.0'
      }
    }
  }
  
  mysql_database { $db_schema_name:
    ensure             => present,
    charset            => 'utf8',
    collate            => 'utf8_general_ci',
  }

}