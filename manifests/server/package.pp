# Install NFS Packages
class nfs::package (
  $ensure   = $nfs::server::package_ensure,
  $packages = $nfs::server::packages,
) {

  package { $packages: ensure  => $ensure }

}

