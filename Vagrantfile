# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/precise64"

  # Benefit from travis infos
  travis_yaml   = File.join(File.dirname(__FILE__), '.travis.yml')
  travis_config = File.exist?(travis_yaml) ? YAML.load_file(travis_yaml) : {}
  # Manage requested packages installation through 'addons.apt.packages'
  if travis_config['addons']
    if travis_config['addons']['apt']
      if travis_config['addons']['apt']['packages']
        config.vm.provision "shell", inline: <<-SHELL
           sudo apt-get -yq --no-install-suggests --no-install-recommends --force-yes install #{travis_config['addons']['apt']['packages'].join(" ")}
        SHELL
      end
    end
  end
  # Manage pre-hook commands listed under before_script
  if travis_config['before_script']
    config.vm.provision "shell", env: { 'TEXMFLOCAL' => '/tmp/texmf' }, inline: <<-SHELL
       #{travis_config['before_script'].join("\n").gsub(/\.\//, '/vagrant/')}
    SHELL
  end
end
