# NFS Server Configuration
class nfs::config (
  $exports            = $nfs::exports,
  $mountd_port        = $nfs::mountd_port,
  $statd_port         = $nfs::statd_port,
  $lockd_port         = $nfs::lockd_port,
  $sysconfig_options  = $nfs::sysconfig_options,
) {
  include nfs::params
  ensure_array($sysconfig_options)

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
      file { '/etc/defaults/nfs-kernel-server':
        content => template('nfs/nfs-kernel-server_defaults.erb')
      }
      file { '/etc/defaults/nfs-common':
        content => template('nfs/nfs-common_defaults.erb')
      }
    }
    default: {}
  }


}
