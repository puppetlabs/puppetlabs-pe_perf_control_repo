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
