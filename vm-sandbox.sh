#!/bin/bash
clear

source $(dirname $0)/functions/common-functions
source $(dirname $0)/functions/shml.sh
source $(dirname $0)/settings.cfg


while getopts “hd:n:i:g:” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         d)
             dist=$OPTARG
             ;;
         n)
             vm_name=$OPTARG
             ;;
         i)
             vm_ip=$OPTARG
             ;;
         g)
             gui_type=$OPTARG
             ;;
     	 ?)
             usage
             exit
             ;;
     esac
done

varcheck $dist
varcheck $vm_name
varcheck $vm_ip
varcheck $gui_type

# Verifying vdipath exists

if [ ! -d ${vdipath} ] ; then
  mkdir ${vdipath}
fi

#building the VirtualBox VM
create_floppy
key_seq_producer
build_vbox_vm
update_hosts_file
wait_for_vm
vm_emptydrive
ssh_keygen_clean
