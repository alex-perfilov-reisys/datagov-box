# encoding: utf-8
# This file originally created at http://rove.io/ac5365beaeaf3720dfa77dead7171abf

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/precise64"
  # config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"
  config.ssh.forward_agent = true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.network :forwarded_port, guest: 80, host: 8888

  config.omnibus.chef_version = :latest

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "./www", "/var/www"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks","my_cookbooks"]

    chef.add_recipe "apt"
    # chef.add_recipe "build-essential"
    chef.add_recipe "apache2"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "php"
    chef.add_recipe "mysql::server"
    chef.add_recipe "php::module_mysql"
    chef.add_recipe "php::module_apc"
    chef.add_recipe "php::module_curl"
    chef.add_recipe "apache2::mod_php5"
    # chef.add_recipe "composer"
    chef.add_recipe 'vim'
    chef.add_recipe 'datagov-apache2'
    #chef.add_recipe 'phpmyadmin'
    chef.json = {
      :php    => {
        :version                => "5.3",
      },
      :mysql  => {
        :version                => "5.5",
        :server_root_password   => "password",
        :server_repl_password   => "password",
        :server_debian_password => "password",
        :service_name           => "mysql",
        :basedir                => "/usr",
        :data_dir               => "/var/lib/mysql",
        :root_group             => "root",
        :mysqladmin_bin         => "/usr/bin/mysqladmin",
        :mysql_bin              => "/usr/bin/mysql",
        :conf_dir               => "/etc/mysql",
        :confd_dir              => "/etc/mysql/conf.d",
        :socket                 => "/var/run/mysqld/mysqld.sock",
        :pid_file               => "/var/run/mysqld/mysqld.pid",
        :grants_path            => "/etc/mysql/grants.sql"
      },
      :apache => {
        :default_site_enabled => "false",
        :dir                  => "/etc/apache2",
        :log_dir              => "/var/log/apache2",
        :error_log            => "error.log",
        :user                 => "www-data",
        :group                => "www-data",
        :binary               => "/usr/sbin/apache2",
        :cache_dir            => "/var/cache/apache2",
        :pid_file             => "/var/run/apache2.pid",
        :lib_dir              => "/usr/lib/apache2",
        :listen_ports         => [
          "80"
        ],
        :contact              => "ops@example.com",
        :timeout              => "300",
        :keepalive            => "On",
        :keepaliverequests    => "100",
        :keepalivetimeout     => "5"
      }
    }
  end
end
