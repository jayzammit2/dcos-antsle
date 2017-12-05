# Script: reboot-all.sh
#
# This script is used to reboot each of the DC/OS Cluster nodes. 
#
# In the context of the installation you will run setup-docker-overlay.sh to set up the OverlayFS in the Linux Kernel. 
#
# The DC/OS documentation recommends that the OverlayFS storage driver be used to avoid 
# known issues with devicemapper in loop-lvm mode to allow containers to use docker-in-docker
#
# See https://dcos.io/docs/1.7/administration/installing/custom/system-requirements/install-docker-centos/

source ../config/env.sh

# Shutdown Master Nodes
#
# By default, the script set's up one Master Node. You are free to add as many as you like.
# If you decide to have multiple Master Nodes, you must configure 3, 5, 7 etc... If you try to
# configure 2 Master nodes, the installation will fail.  The reason is because of Master node consistency
# requirements.
#
# To maintain consistency, a quorum (half plus one) of master nodes must be connected at all times.
# For example, having three master nodes allows one to be down; having five master nodes allows two to be down, 
# allowing for failure during a rolling update. Additional master nodes can be added for additional risk tolerance.
# The number of master nodes can only be specified during installation. This is primarily because of the complexity i
# of changing the quorum and configuration of multiple components with leaders on different nodes. This may change in the future. 
#
# See https://dcos.io/docs/1.9/overview/architecture/node-types/

ssh -t ${MASTER1_NODE_IP} 'shutdown -r now'  
# ssh -t ${MASTER2_NODE_IP} 'shutdown -r now'  
# ssh -t ${MASTER3_NODE_IP} 'shutdown -r now'  

# Shutdown Public Agent Nodes
#
# By default, the script set's up two public agents. You are free to add as many as you like 
#
# A public agent node is an agent node that is on a network that allows ingress from outside of the cluster 
# via the cluster’s infrastructure networking.

ssh -t ${PUBLIC_AGENT1_NODE_IP} 'shutdown -r now' 
ssh -t ${PUBLIC_AGENT2_NODE_IP} 'shutdown -r now' 
# ssh -t ${PUBLIC_AGENT3_NODE_IP} 'shutdown -r now' 
# ssh -t ${PUBLIC_AGENT4_NODE_IP} 'shutdown -r now' 
# ssh -t ${PUBLIC_AGENT5_NODE_IP} 'shutdown -r now' 

# Shutdown Public Agent Nodes
#
# By default, the script set's up three public agents. You are free to add as many as you like
#
# A public agent node is an agent node that is on a network that allows ingress from outside of the cluster
# via the cluster’s infrastructure networking.

ssh -t ${PRIVATE_AGENT1_NODE_IP} 'shutdown -r now'
ssh -t ${PRIVATE_AGENT2_NODE_IP} 'shutdown -r now'
ssh -t ${PRIVATE_AGENT3_NODE_IP} 'shutdown -r now'
ssh -t ${PRIVATE_AGENT4_NODE_IP} 'shutdown -r now'
ssh -t ${PRIVATE_AGENT5_NODE_IP} 'shutdown -r now'
ssh -t ${PRIVATE_AGENT6_NODE_IP} 'shutdown -r now'
ssh -t ${PRIVATE_AGENT7_NODE_IP} 'shutdown -r now'

