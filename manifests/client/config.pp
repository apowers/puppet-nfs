# NFS Server Configuration
class nfs::client::config (
  $mountd_port        = $nfs::client::mountd_port,
  $statd_port         = $nfs::client::statd_port,
  $lockd_port         = $nfs::client::lockd_port,
  $sysconfig_options  = $nfs::client::sysconfig_options,
) {
  include nfs::params
  validate_array($sysconfig_options)

  $config = $nfs::params::config

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
