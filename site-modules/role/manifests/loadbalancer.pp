# @summary
#   Role for loadbalancer only containing the loadbalancer profile.
#
# @param balance_type
#   Method to use for load balancing
#
# @param stats_username
#   Username for authenticating to the stats web interface
#
# @param stats_password
#   Password for authenticating to the stats web interface
#
# @param stats_port
#   Port to publish the stats web interface on
#
class role::loadbalancer(
  $balance_type   = 'leastconn',
  $stats_username = 'puppet',
  $stats_password = 'puppet',
  $stats_port     = '9090',
){
  profile::loadbalancer { 'loadbalancer':
    balance_type   => $balance_type,
    stats_username => $stats_username,
    stats_password => $stats_password,
    stats_port     => $stats_port,
  }
}
