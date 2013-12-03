# NFS Default Parameters
class nfs::params {
  $packages = $::osfamily ? {
    'RedHat'  => ['nfs-utils','rpcbind'],
    'Debian'  => ['nfs-kernel-server','portmap']
  }

  $services = $::osfamily ? {
    'RedHat'  => ['nfs-utils','rpcbind'],
    'Debian'  => ['nfs-kernel-server','portmap']
  }

  $config = '/etc/exports'

}
