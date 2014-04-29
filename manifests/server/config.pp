# NFS Server Configuration
class nfs::config (
  $exports            = $nfs::server::exports,
  $mountd_port        = $nfs::server::mountd_port,
  $statd_port         = $nfs::server::statd_port,
  $lockd_port         = $nfs::server::lockd_port,
  $sysconfig_options  = $nfs::server::sysconfig_options,
) {
  include nfs::params
  validate_array($sysconfig_options)

  $config = $nfs::params::config

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nfs/exports.erb'),
  }

  exec {  'reload_nfs_exports_from_file':
    command     => '/usr/sbin/exportfs -a',
    alias       => 'exportfs',
    refreshonly => true,
    subscribe   => File[$config],
  }

  case $::osfamily {
    'RedHat': {
      file { '/etc/sysconfig/nfs':
        content => template('nfs/sysconfig.erb')
      }
    }
    'Debian': {
      file { '/etc/default/nfs-kernel-server':
        content => template('nfs/nfs-kernel-server.erb')
      }
      file { '/etc/default/nfs-common':
        content => template('nfs/nfs-common.erb')
      }
    }
    default: {}
  }


}
