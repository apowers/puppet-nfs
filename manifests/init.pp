# NFS Class
#
class nfs (
  $role           = 'client',
  $exports        = [],
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
) {

  class { 'nfs::params' }
  -> class { 'nfs::package' }

  if $role == 'server' {
    class { 'nfs::config'
      require => Class['nfs::package']
    }
    -> class { 'nfs::service' }
  }

}
