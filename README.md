# dcos-setup
Setup Mesosphere DC/OS Open Source Cluster (See https://mesosphere.com for information on DC/OS)

# Install Instruction

# NOTE: It is very important that each step be done in the order listed

ssh into DC/OS boot node

yum install -y git tree

cd dcos-setup/scripts/all-nodes

./all-keys.sh

./all-node-base.sh

./all-overlay.sh 

./all-reboot.sh 

 ../utils/check-if-available-after-reboot.sh 

./all-node-base.sh 

./all-reboot.sh 

../utils/check-if-available-after-reboot.sh 

./all-boot-node.sh 

./all-master-node.sh 

./all-agent-node-private.sh

./all-agent-node-public.sh




