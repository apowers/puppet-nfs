# NFS Server Configuration
class nfs::config (
  $exports = $nfs::exports,
  $config  = $nfs::params::config
) {

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nfs/exports.erb'),
  }

  exec {  'reload_nfs_exports_from_file':
    command     => '/usr/sbin/exportfs -a',
    alias       => 'exportfs',
    refreshonly => true,
    subscribe   => File[$config],
  }

}
