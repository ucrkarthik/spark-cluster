#!/bin/bash
# $1 = Vagrantfile location
# $2 = arg name

# looks throught Vagrantfile for "$2 = [output]"
# and returns [output]

function parseVagrantfile() {
echo $(egrep "$2.*=" $1/Vagrantfile | \
       awk -F "=" '{print $2}' | \
       sed 's/[[:space:]]//g' | \
       sed 's/\"//g')
}
