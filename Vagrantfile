Vagrant::Config.run do |config|
    config.vm.box = 'precise64'
    config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

    # Use :gui for showing a display for easy debugging of vagrant
    # config.vm.boot_mode = :gui

    # Default dev box
    config.vm.define :vagrantproject do |project_config|
        project_config.vm.host_name = "dev.vagrantproject.projects.enrise.com"

        project_config.vm.network :hostonly, "192.168.56.3"

        # Pass custom arguments to VBoxManage before booting VM
        project_config.vm.customize [
            'modifyvm', :id,
            '--chipset', 'ich9', # solves kernel panic issue on some host machines
            '--memory', '386', # set memory
        ]

        # Pass installation procedure over to Puppet (see `support/puppet/manifests/project.pp`)
        project_config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "dev/puppet/manifests"
            puppet.module_path = "dev/puppet/modules"
            puppet.manifest_file = "site.pp"
            puppet.options = [
                '--verbose',
                '--debug',
            ]
        end
    end
end
