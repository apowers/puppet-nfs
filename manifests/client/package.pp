# Install NFS Packages
class nfs::client::package (
  $ensure   = $nfs::client::package_ensure,
  $packages = $nfs::client::package_name,
) {
  include 'nfs::params'

  package { $packages: ensure  => $ensure }

}

