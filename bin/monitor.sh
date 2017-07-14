#!/bin/bash
VF_LOC="../vagrant"

############################################
# Parse setup information from Vagrantfile #
############################################

source parseVagrantfile.sh

SUBNET=$(parseVagrantfile $VF_LOC "SUBNET")
BASE_HOST=$(parseVagrantfile $VF_LOC "BASE_HOST")

open -a "Google Chrome" http://$SUBNET.$BASE_HOST:8080 http://$SUBNET.$BASE_HOST:50070 http://$SUBNET.$BASE_HOST:8088
