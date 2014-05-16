# == Class: crond
#
# Full description of class crond here.
#
# === Parameters
#
# Document parameters here.
#
class crond {
  define crondjob(
    $enable   = true,
    $minute   = '0',
    $hour     = '*',
    $day      = '*',
    $month    = '*',
    $weekday  = '*',
    $user     = 'root',
    $command  = undef,
    $shell    = '/bin/bash',
    $cmdpath  = '/sbin:/bin:/usr/sbin:/usr/bin',
  ) {

    if $enable {
      $ensure = file
    } else {
      $ensure = absent
    }

    file { "/etc/cron.d/$name":
      ensure  => $ensure,
      content => template('crond/crond-job.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }
}
