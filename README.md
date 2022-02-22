# DevzBox

Batteries included, automated deployment of disposable dev envs based on Ubuntu 20.04

## About

Currently, it's tested only for Windows because IMHO Win users have the worst dev experience so it's worth solving this first.
It uses [Vagrant](https://www.vagrantup.com/intro) as a platform to run and provision VMs.  
VMs use [NoMachine](https://www.nomachine.com/) remote desktop to deliver blazing fast, low latency experience.  
This is mainly for local usage with 16GB RAM+ but you can use it on remote dedicated servers with a lot of resources or big VMs too.

Without any customization it will spawn VM with:
- Ubuntu 20.04 LTS Desktop upgraded to latest version
- additional apt packages: `make gcc g++ gettext-base pwgen wget curl`
- Golang from snap (automatically updated)
- Node.js 14.x LTS from apt repo (upgradable with apt-get)
- Docker from official apt repo (upgradable with apt-get) and docker-compose as a container
- k8s cluster with 
  - `kind` from `go get`
  - `kubectl` and `helm` from snap (automatically updated)
- NoMachine remote desktop server exposed only via local network
- JetBrains Toolbox with selected dark skin and no analytics selected, for easily installation and one-click upgrades of IntelliJ IDEA etc.

You can easily add your custom scripts to install in `provision/custom`

## Setup

To use it, you first need to:

### Windows

- Enable Hyper-V - [tutorial](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)
    - It doesn't work on Windows Home, you need Pro, Enterprise or similar - [windows editions on wikipedia](https://en.wikipedia.org/wiki/Windows_10_editions#Comparison_chart)
      - VirtualBox support is already planned for this very reason: [issue #2](https://github.com/SystemZ/devzbox/issues/2)
- Create Virtual Switch in Hyper-V and rebooted after [tutorial](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/create-a-virtual-switch-for-hyper-v-virtual-machines)
- Install Vagrant - [download](https://www.vagrantup.com/downloads)
- Install Git - [download](https://git-scm.com/downloads)
- Install [gsudo](https://github.com/gerardog/gsudo) (optional), just run this in Powershell without admin perms:
  ```powershell
  PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"
  ```

## Usage

### Create VM

With all prerequisites installed, just 
1. Clone and enter this repo
   ```bash
   git clone https://github.com/SystemZ/devzbox
   cd devzbox
   ```
1. Copy template of VM and create your own VM with name like `niceproject` and enter it.
   ```bash
   cd vm
   cp -r _template niceproject
   cd niceproject
   ```
1. Edit `vm/niceproject/Vagrantfile` to your liking. 
   Probably you just want to uncomment some lines that are installing tools. 
   There are `!!! CHANGE ME !!!` blocks in places that you should edit 
1. Start and provision VM
   ```bash
   # use Hyper-V on Windows
   # after launching you will be asked about Hyper-V Virtual Switch, just enter number with proper ID
   sudo vagrant up --provider=hyperv
   ```
1. Wait until "Provisioning complete!" is shown, note your username `vagrant` and fresh random password for SSH and virtual desktop

### Connect to VM

#### Remote desktop

1. Install NoMachine (NX for short) and connect with it - [download link](https://www.nomachine.com/).
1. Launch NoMachine client on your main OS.  
   Your VM should be visible after launching, just double click it to connect.
   Select "Change the remote display resolution to match the window" when prompted on first connect about "Display resolution".
   Change resolution will allow to resize your remote desktop freely as you please just by resizing remote desktop window
1. Make sure that Windows isn't blurring your remote desktop by enforcing 100% scaling on NX player
1. If you need even more low latency, there are additional graphic options worth noting:
   >Hi,
   >
   >NoMachine automatically adapts to network conditions, so I wouldn’t change many of the default options. In particular I’d leave H.264 as it could leverage hardware encoding and decoding.  In the Display settings panel I’d change display quality to max, choose to request 60 frame per second and select ‘Disable frame buffering on decoding’ along with ‘Disable client side image post-processing’. You may also want to disable UDP by clicking to Edit the connection and selecting Advanced settings.
   >
   >fra81
    * https://forums.nomachine.com/topic/recommended-settings-for-fast-local-lan-connections-only

#### SSH

*Protip* If don't remember commands for Vagrant, check out this [Vagrant cheatsheet](https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4)

```
sudo vagrant ssh
```

### Start VM next sessions after first run

Vagrant is quite slow as a CLI.  
If you use VM mainly for remote desktop, you can skip Vagrant part for booting and just run VM itself from Hyper-V manager GUI or
```
# 
# VM name visible here is from Vagrantfile "vmname" variable
sudo Start-VM -Name awesomeproject
```

### Password reset

TODO

### Remove VM

Enter `vm/niceproject` and execute:
```
sudo vagrant destroy -f
```

### Notes

Login screen on desktop can blink when password is accepted, just wait about a 30 seconds and you will be logged in eventually.

### Maintenance

Update your virtualized OS as you would normally do.  
Almost all apps are updated by `apt`.

## Origin

After few years of Ubuntu usage as a main driver, author of this project moved to Windows due to a bunch of time wasted on dual booting for games and few apps like Adobe suite. Unfortunately Windows didn't offer everything I wanted, so I decided to make an easy-to-use VM factory to store complete dev environments for few separate projects that I work on.

With this approach I have support for all apps I need without dualbooting, and a power and flexibility of FOSS apps on Ubuntu. You just suspend or turn off VMs if you need some free time in games :)
The only drawback are infamous Windows updates that can crash your OS, but fortunately I didn't encounter them myself. 
