# @summary
#   Profile for loadbalancer_exports to create puppet and pcp
#   haproxy balancemembers.
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
class profile::loadbalancer_exports(
  $haproxy_options = 'check',
  $puppet_port     = '8140',
  $pcp_port        = '8142',
){

  @@haproxy::balancermember { "compile-${::fqdn}":
    listening_service => 'compile',
    server_names      => $::fqdn,
    ipaddresses       => pe_delete_undef_values(pe_unique([$::ipaddress, $::ipaddress_eth0, $::ipaddress_eth1])),
    ports             => $puppet_port,
    options           => $haproxy_options,
  }

  @@haproxy::balancermember { "pcp-${::fqdn}":
    listening_service => 'pcp',
    server_names      => $::fqdn,
    ipaddresses       => pe_delete_undef_values(pe_unique([$::ipaddress, $::ipaddress_eth0, $::ipaddress_eth1])),
    ports             => $pcp_port,
    options           => $haproxy_options,
  }
}
