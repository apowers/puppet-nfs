# NFS Default Parameters
class nfs::params {
  $packages = $::osfamily ? {
    /(?i-mx:redhat|scientific)/ => ['nfs-utils','rpcbind'],
    /(?i-mx:debian)/            => ['nfs-kernel-server','rpcbind']
  }

  $services = $::osfamily ? {
    /(?i-mx:redhat|scientific)/ => ['rpcbind','nfs'],
    /(?i-mx:debian)/ => ['rpcbind','nfs'],
  }

  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/exports',
  }

}
