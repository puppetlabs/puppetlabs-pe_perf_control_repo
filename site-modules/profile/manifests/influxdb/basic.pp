class profile::influxdb::basic {

  $graphite_config = {
    'default' => {
      'enabled'           => true, # not default
    }
  }

  $udp_config = {
    'udp1' => {
      'enabled'       => true,
      'bind-address'  => ':8089',
      'database'      => 'udp_db1',
      'batch-size'    => 10000,
      'batch-timeout' => '1s',
      'batch-pending' => 5,
    },
    'udp2' => {
      'enabled'       => true,
      'bind-address'  => ':8090',
      'database'      => 'udp_db2',
      'batch-size'    => 10000,
      'batch-timeout' => '1s',
      'batch-pending' => 5,
    },
}

  class { 'influxdb':
    manage_repos     => true,
    graphite_config  => $graphite_config,
    udp_config       => $udp_config,
  }

}
