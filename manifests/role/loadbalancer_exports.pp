# @summary
#   Role for loadbalancer_exports only containing the
#   loadbalancer_exports profile.
#
# @param haproxy_options
#   Options to use fro the haproxy balancermember
#
# @param puppet_port
#   Port for haproxy to listen on for the puppet service
#
# @param pcp_port
#   Port for haproxy to listen on for the pcp service
#
class role::loadbalancer_exports(
  $haproxy_options = 'check',
  $puppet_port     = '8140',
  $pcp_port        = '8142',
){

  profile::loadbalancer_exports { 'loadbalancer_exports':
    haproxy_options => $haproxy_options,
    puppet_port     => $puppet_port,
    pcp_port        => $pcp_port,
  }
}
