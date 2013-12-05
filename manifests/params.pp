# NFS Default Parameters
class nfs::params {
  $packages = $::osfamily ? {
    'RedHat'  => ['nfs-utils','rpcbind'],
    'Debian'  => ['nfs-kernel-server']
  }

  $services = $::osfamily ? {
    'RedHat'  => ['nfs-utils','rpcbind'],
    'Debian'  => ['nfs-kernel-server','statd']
  }

  $config = '/etc/exports'

}
