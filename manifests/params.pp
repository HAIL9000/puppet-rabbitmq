# Class: rabbitmq::params
#
#   The RabbitMQ Module configuration settings.
#
class rabbitmq::params {

  case $facts['os']['family'] {
    'Archlinux': {
      $package_ensure   = 'installed'
      $package_name     = 'rabbitmq'
      $service_name     = 'rabbitmq'
      $rabbitmq_user    = 'rabbitmq'
      $rabbitmq_group   = 'rabbitmq'
      $rabbitmq_home    = '/var/lib/rabbitmq'
    }
    'Debian': {
      $package_ensure   = 'installed'
      $package_name     = 'rabbitmq-server'
      $service_name     = 'rabbitmq-server'
      $rabbitmq_user    = 'rabbitmq'
      $rabbitmq_group   = 'rabbitmq'
      $rabbitmq_home    = '/var/lib/rabbitmq'
    }
    'OpenBSD': {
      $package_ensure   = 'installed'
      $package_name     = 'rabbitmq'
      $service_name     = 'rabbitmq'
      $rabbitmq_user    = '_rabbitmq'
      $rabbitmq_group   = '_rabbitmq'
      $rabbitmq_home    = '/var/rabbitmq'
    }
    'FreeBSD': {
      $package_ensure   = 'installed'
      $package_name     = 'rabbitmq'
      $service_name     = 'rabbitmq'
      $rabbitmq_user    = 'rabbitmq'
      $rabbitmq_group   = 'rabbitmq'
      $rabbitmq_home    = '/var/db/rabbitmq'
    }
    'RedHat': {
      $package_ensure   = 'installed'
      $package_name     = 'rabbitmq-server'
      $service_name     = 'rabbitmq-server'
      $rabbitmq_user    = 'rabbitmq'
      $rabbitmq_group   = 'rabbitmq'
      $rabbitmq_home    = '/var/lib/rabbitmq'
    }
    'SUSE': {
      $package_ensure   = 'installed'
      $package_name     = 'rabbitmq-server'
      $service_name     = 'rabbitmq-server'
      $rabbitmq_user    = 'rabbitmq'
      $rabbitmq_group   = 'rabbitmq'
      $rabbitmq_home    = '/var/lib/rabbitmq'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${facts['os']['family']} based system.")
    }
  }

  #install
  $admin_enable                = true
  $management_port             = 15672
  $management_ssl              = true
  $package_apt_pin             = ''
  $package_gpg_key             = 'https://www.rabbitmq.com/rabbitmq-release-signing-key.asc'
  $repos_ensure                = false
  $service_ensure              = 'running'
  $service_manage              = true
  #config
  $cluster_node_type           = 'disc'
  $cluster_nodes               = []
  $config                      = 'rabbitmq/rabbitmq.config.erb'
  $config_cluster              = false
  $config_path                 = '/etc/rabbitmq/rabbitmq.config'
  $config_stomp                = false
  $config_shovel               = false
  $config_shovel_statics       = {}
  $default_user                = 'guest'
  $default_pass                = 'guest'
  $delete_guest_user           = false
  $env_config                  = 'rabbitmq/rabbitmq-env.conf.erb'
  $env_config_path             = '/etc/rabbitmq/rabbitmq-env.conf'
  $port                        = 5672
  $tcp_keepalive               = false
  $tcp_backlog                 = 128
  $ssl                         = false
  $ssl_only                    = false
  $ssl_port                    = 5671
  $ssl_management_port         = 15671
  $ssl_stomp_port              = 6164
  $ssl_verify                  = 'verify_none'
  $ssl_fail_if_no_peer_cert    = false
  $ssl_ciphers                 = []
  $stomp_ensure                = false
  $ldap_auth                   = false
  $ldap_server                 = 'ldap'
  $ldap_user_dn_pattern        = 'cn=username,ou=People,dc=example,dc=com'
  $ldap_other_bind             = 'anon'
  $ldap_use_ssl                = false
  $ldap_port                   = 389
  $ldap_log                    = false
  $ldap_config_variables       = {}
  $stomp_port                  = 6163
  $stomp_ssl_only              = false
  $wipe_db_on_cookie_change    = false
  $cluster_partition_handling  = 'ignore'
  $environment_variables       = {}
  $config_variables            = {}
  $config_kernel_variables     = {}
  $config_management_variables = {}
  $config_additional_variables = {}
  $file_limit                  = '16384'
  $ipv6                        = false
  $inetrc_config               = 'rabbitmq/inetrc.erb'
  $inetrc_config_path          = '/etc/rabbitmq/inetrc'
  $ssl_erl_dist                = false
}
