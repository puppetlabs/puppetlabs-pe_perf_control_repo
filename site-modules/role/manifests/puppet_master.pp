#
class role::puppet_master {
  include profile::puppet_master
  include puppet_metrics_collector::system
}
