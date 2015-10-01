class jbdeploy::dep {
  if ! defined(Package['wget']) {
    package { 'wget' : ensure => present }
  }

  if ! defined(Package['unzip']) {
    package { 'unzip' : ensure => present }
  }
  
  if ! defined(Class['java']) {
    include java
  }
  
  if ! defined(Class['jboss']) {
    include jboss
  }
}
