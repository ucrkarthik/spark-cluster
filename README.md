# Spark Cluster

Use a combination of vagrant and ansible to create a spark cluster.

## vagrant

Spin up local VMs with virtualbox.

- Control the number of vms created with the NUM_VMS parameter in Vagrantfile
- Control access by creating an ssh keypair (root, root.pub). Make sure these are in ~/.ssh, then set the SSH_KEY parameter in Vagrantfile to match.

## ansible

- **run.sh:** This script uses bash to create the hosts file by parsing the Vagrantfile at ../Vagrantfile.
- If you do not have bash, you will need to manually prepare the hosts file and then launch ansible with  
`ansible-playbook -i hosts spark-cluster.yml`
- If you also want python installed on all the nodes run  
`ansible-playbook -i hosts spark-cluster.yml`
