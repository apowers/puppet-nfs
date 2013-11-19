define nfs::client (
  $mount,
  $device,
  $options,
  $atboot
) {
  file { $mount:
    ensure => directory,
  }

  mount { $mount:
    device  => $device,
    fstype  => 'nfs',
    ensure  => 'mounted',
    options => $options,
    atboot  => $atboot,
    require => File[$mount],
  }

}
