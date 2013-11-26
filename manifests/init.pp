# NFS Class
#
class nfs (
  $package_ensure = 'installed',
  $service_ensure = 'stopped',
  $service_enable = true,
  $exports        = []
) {

  class { 'nfs::params': }
  -> class { 'nfs::package': }
  -> class { 'nfs::config': }
  -> class { 'nfs::service': }

}
