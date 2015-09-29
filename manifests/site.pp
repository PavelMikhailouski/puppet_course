node default {
  include 'mysql::server'
}
mysql_user { 'test_user@vm1':
  ensure        => present,
  password_hash => mysql_password('password'),
  require       => Class['mysql::server']
}
mysql_database { 'test_mdb':
  ensure  => present,
  charset => 'utf8',
  require => Class['mysql::server']
}
mysql_grant { 'test_user@vm1/test_mdb.*':
  ensure     => present,
#  options    => ['GRANT'],
  privileges => ['ALL'],
  table      => 'test_mdb.*',
  user       => 'test_user@vm1',
  require    => Class['mysql::server']
}
