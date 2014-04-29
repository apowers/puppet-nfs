# Defined Type for NFS Mounts
define nfs::mount (
  $mount    = undef,
  $device   = undef,
  $options  = undef,
  $atboot   = true,
) {

  ensure_resource('file',$mount,{ensure => 'directory'})

  mount { $mount:
    ensure    => 'mounted',
    device    => $device,
    options   => $options,
    atboot    => $atboot,
    require   => File[$mount],
    fstype    => 'nfs',
    dump      => '0',
    pass      => '3',
    remounts  => true,
  }

}
