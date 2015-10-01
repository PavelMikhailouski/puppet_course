class jbdeploy {
  include jbdeploy::dep
  exec { 'install':
    command => '/usr/bin/wget -c http://www.cumulogic.com/download/Apps/testweb.zip -P /tmp && unzip -o /tmp/testweb.zip -d /opt/jboss/server/default/deploy/ ',
    require => [ Class['java'], Class['jboss'], Package[wget], Package[unzip] ]
  }
}
