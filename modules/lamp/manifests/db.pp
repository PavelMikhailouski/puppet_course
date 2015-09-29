# Class: db
#
# This module manages databases
#
# Parameters:
#
# [*user*]
#   User for the database to manage
# [*password*]
#   Password for the database user
#
# Requires: see metadata.json
#
# Sample Usage:
#   class { 'lamp::db': user => 'your-user', password => 'your-password' }
#

define lamp::db($user, $password) {
  exec { "create-${name}-db":
    unless => "mysql -u${user} -p${password} ${name}",
    command => "mysql -uroot -p${lamp::rootPassword} -e \"create database ${name}; grant all on ${name}.* to ${user}@* identified by '${password}';\"",
    require => Service['mysqld']
  }
}