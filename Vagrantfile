# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu1404"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Port for Apache server
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # Port for accessing PostgreSQL
  config.vm.network "forwarded_port", guest: 5432, host: 54320

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Shared & synced folders
  config.vm.synced_folder "./Code", "/var/www/Code"

  # Chef provisioning
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"

    chef.add_recipe "apache2"
    chef.add_recipe "postgresql"
    chef.add_recipe "php"
    chef.add_recipe "nodejs"

    chef.json = {
      apache: {
        default_site_enabled: true
      },

      php: {
        pear: {
          package_name: "mongo"
        }
      },

      nodejs: {
        engine: 'node',
        npm_packages: [
          { name: "bower" },
          { name: "gulp" },
          { name: "grunt-cli" },
          { name: "yo" }
        ]
      },

      postgresql: {
        enable_pgdg_apt: true,
        version: "9.4",
        client: {
          packages: ["postgresql-client"]
        },
        server: {
          packages: ["postgresql"],
          config_change_notify: :reload
        },
        password: {
          # password
          postgres: 'md532e12f215ba27cb750c9e093ce4b5127'
        },
        config: {
          port: 5432,
          listen_addresses: 'localhost'
        }
      }
    }
  end
end
