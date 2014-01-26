#vm-sandbox

Stupid scripts to quickly provision CentOS 5/6 VirtualBox VMs on a laptop/workstations.
The process is easy and *doesn't* involve a pxe boot :
* find the correct boot.iso for the version you want to install
* create a floppy disk with a templated kickstart
* create a virtualbox VM and attach the boot.iso and the floopy
* boot the vm and type 'linux ks=floppy' at the prompt, to read the ks.cfg file and proceed to installation

## Requirements
* You need VirtualBox on your laptop/workstation.
* By default, vm-sandbox will try to attach to a HostOnly network that you need to define in VirtualBox (I use vboxnet0, so the first one created in vbox)
* You'll also need a local CentOS mirror (only currently playing with x86_64 myself)
* If you want your Virtual Machines to have external network access, don't forget to adapt your firewall/iptables rules !

## Configuration
There is a minimal settings.cfg file that you need to use, like for example where to find locally your centos mirror (self-explained)
If you need the initial root password, it's "vm4me"

## Usage
> ./vm-sandbox.sh -h
