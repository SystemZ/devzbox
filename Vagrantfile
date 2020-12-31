Vagrant.configure("2") do |config|

  # OS to install, here we use minimal Ubuntu 20.04 Server LTS and install desktop env later
  # you can find more automatically built and updated images @
  #  https://app.vagrantup.com/roboxes
  #  https://roboxes.org/
  config.vm.box = "roboxes/ubuntu2004"

### !!! CHANGE ME START !!!
  # Hostname inside of VM
  config.vm.hostname = "devzbox"
  config.vm.provider "hyperv" do |h|
    h.vmname = "devzbox"
    # CPU threads assigned to VM
    # Usually set all you have minus 1-2 for your own OS as failsafe
	h.cpus = 4
	# Minimum assigned memory to VM in MB
	h.memory = 1024
	# Maximal assigned memory to VM in MB
    h.maxmemory = 4096
### !!! CHANGE ME END !!!

    # Allows pretty fast remote desktop in Hyper-V Manager but not as fast as NX so we don't need it
    # Use it as fallback
    #h.vm_integration_services = {
      #guest_service_interface: true,
      #CustomVMSRV: true
    #}

	# This on Hyper-V works only on Intel CPUs so far in 2020
	# Needed if you want VM in VM setup
	#h.enable_virtualization_extensions = true
  end

### !!! CHANGE ME START !!!
  # Install things only you need
  #config.vm.provision "shell", path: "../../provision/custom/unused-script-example.sh"
  config.vm.provision "shell", path: "../../provision/bash/date-save.sh"
  config.vm.provision "shell", path: "../../provision/bash/debian-upgrade-safe.sh"
  config.vm.provision "shell", path: "../../provision/bash/debian-tools-common.sh"
  config.vm.provision "shell", path: "../../provision/bash/debian-node-js-14.sh"
  config.vm.provision "shell", path: "../../provision/bash/docker.sh"
  config.vm.provision "shell", path: "../../provision/bash/snap-go.sh"
  config.vm.provision "shell", path: "../../provision/bash/k8s-kind.sh"
  config.vm.provision "shell", path: "../../provision/bash/ubuntu-desktop-minimal.sh"
  config.vm.provision "shell", path: "../../provision/bash/nomachine-7.sh"
  config.vm.provision "shell", path: "../../provision/bash/jb-toolbox-conf.sh"
  config.vm.provision "shell", path: "../../provision/bash/jb-toolbox.sh"
### !!! CHANGE ME END !!!
end
