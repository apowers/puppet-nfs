# NFS Default Parameters
class nfs::params {
  $packages = $::osfamily ? {
    'RedHat'  => ['nfs-utils','rpcbind'],
    'Debian'  => ['nfs-kernel-server']
  }

  $services = $::osfamily ? {
    'RedHat'  => ['nfs', 'nfslock', 'rpcbind'],
    'Debian'  => ['nfs-kernel-server','statd']
  }

  $client_services = $::osfamily ? {
    'RedHat'  => ['rpcbind'],
    'Debian'  => ['statd']
  }

  $config = '/etc/exports'

}
