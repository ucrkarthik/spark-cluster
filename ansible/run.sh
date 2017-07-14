#!/bin/bash

# Vagrantfile location
VF_LOC="../vagrant"

############################################
# Parse setup information from Vagrantfile #
############################################

# Load function parseVagrantfile
source ../bin/parseVagrantfile.sh

NUM_VMS=$(parseVagrantfile $VF_LOC "NUM_VMS")
SUBNET=$(parseVagrantfile $VF_LOC "SUBNET")
BASE_HOST=$(parseVagrantfile $VF_LOC "BASE_HOST")
HOSTNAME=$(parseVagrantfile $VF_LOC "HOSTNAME")
SSH_KEY=$(parseVagrantfile $VF_LOC "SSH_KEY")

#######################
# Generate hosts file #
#######################
echo "[primary]" > hosts
HOST=$BASE_HOST
echo -e "$HOSTNAME-1 ansible_host=$SUBNET.$HOST\n" >> hosts

echo "[ancillary]" >> hosts
for (( i=2; i<=$NUM_VMS; i++ ))
do
   HOST=$(($BASE_HOST + $i - 1))
   echo "$HOSTNAME-$i ansible_host=$SUBNET.$HOST" >> hosts
done

echo "
[cluster-nodes:children]
primary
ancillary

[cluster-nodes:vars]
ansible_ssh_user=vagrant
ansible_private_key_file=$SSH_KEY
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
" >> hosts

ansible-playbook -i hosts spark-cluster.yml
ansible-playbook -i hosts pythonEnv.yml
