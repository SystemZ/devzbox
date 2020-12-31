# DevzBox

**WIP, need few bugs fixed!**

Batteries included, automated deployment of user-friendly, disposable developer environments based on Ubuntu

## About

Currently, it's tested only for Windows because IMHO Win users have the worst dev experience so it's worth solving this first.
It uses [Vagrant](https://www.vagrantup.com/intro) as a platform to run and provision VMs.  
VMs use [NoMachine](https://www.nomachine.com/) remote desktop to deliver blazing fast, low latency experience.  
This is mainly for local usage with 16GB RAM+ but you can use it on remote dedicated servers with a lot of resources or big VMs too.

Without any customization it will spawn VM with:
- Ubuntu 20.04 LTS Desktop upgraded to latest version
- installed packages: `make gcc g++ gettext-base wget curl`
- Golang from snap (automatically updated)
- Node.js 14.x LTS from apt repo (upgradable with apt-get)
- Docker from apt repo (upgradable with apt-get)
- k8s cluster with 
  - `kind` from `go get`
  - `kubectl` and `helm` from snap (automatically updated)
- NoMachine remote desktop
- JetBrains Toolbox with selected dark skin and no analytics selected, for easily installation and one-click upgrades of IntelliJ IDEA etc.

You can easily add your scripts to install what you need

## Setup

To use it, you need to install first:

### Windows

- Gsudo installed
- Hyper-V enabled (doesn't work on Windows Home, you need Pro, Enterprise or other Edition)
- Already created Virtual Switch in Hyper-V
- Vagrant installed

## Usage

### VM creation

With all prerequisites installed, just 
1. Clone this repo 
1. Create new folder in `vm` dir with short, memorable name like `niceproject`. 
1. Copy `Vagrantfile` to `vm/niceproject`. 
1. Edit `vm/niceproject/Vagrantfile` to your liking. 
   Probably you just want to uncomment some lines that are installing tools. 
   There are `!!! CHANGE ME !!!` blocks in places that you should edit 
1. Change your current dir to `vm/niceproject` and execute 
```
sudo vagrant up --provider=hyperv
```

### VM deletion

Enter `vm/niceproject` and execute:
```
sudo vagrant destroy -f
```

### VM usage

```
# for SSH session
sudo vagrant ssh
```

### Notes

Login screen can blink when password is accepted, just wait about a minute and you will be logged in

### Maintenance

## Origin

After few years of Ubuntu usage as a main driver, author of this project moved to Windows due to a bunch of time wasted on dual booting due to games and few apps like Adobe suite. Unfortunately Windows didn't offer everything I wanted, so I decided to make an easy-to-use VM factory to store complete dev environments for few separate projects that I work on.

With this approach I have support for all apps I need without dualbooting, and a power and flexibility of FOSS apps on Ubuntu. You just suspend or turn off VMs if you need some free time in games :)
The only drawback are infamous Windows updates that can crash your OS, but fortunately I didn't encounter them myself. 
