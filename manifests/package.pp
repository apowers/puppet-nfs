# Install NFS Packages
class nfs::package (
  $ensure = $nfs::package_ensure
) {
  include 'nfs::params'

  $packages = $nfs::params::packages
  package { $packages: ensure  => $ensure }

}

