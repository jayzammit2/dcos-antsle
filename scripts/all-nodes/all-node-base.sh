# This script runs the node-base.sh script. node-base.sh installs the required
# software common to all DC/OS cluster nodes.  For example docker is required to be installed
# on all nodes.
#
# By default this script configures 1 master agent, two public agents, and three private agents. You are free to modify to handle as many
# master nodes and public/private agents as you need.
#
# For a definition of each node type, see the following link
#
# https://dcos.io/docs/1.9/overview/architecture/node-types/

source ../config/env.sh
../by-node/node-base.sh &

# Install to Master Nodes
ssh ${MASTER1_NODE_IP} 'bash -s' < ../by-node/node-base.sh  
# ssh ${MASTER2_NODE_IP} 'bash -s' < ../by-node/node-base.sh  
# ssh ${MASTER3_NODE_IP} 'bash -s' < ../by-node/node-base.sh  

# Install to Public Agent Nodes
ssh ${PUBLIC_AGENT1_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
ssh ${PUBLIC_AGENT2_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
# ssh ${PUBLIC_AGENT3_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
# ssh ${PUBLIC_AGENT4_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
# ssh ${PUBLIC_AGENT5_NODE_IP} 'bash -s' < ../by-node/node-base.sh 


# Install to Private Agent Nodes
ssh ${PRIVATE_AGENT1_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
ssh ${PRIVATE_AGENT2_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
ssh ${PRIVATE_AGENT3_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
# ssh ${PRIVATE_AGENT4_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
# ssh ${PRIVATE_AGENT5_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
# ssh ${PRIVATE_AGENT6_NODE_IP} 'bash -s' < ../by-node/node-base.sh 
# ssh ${PRIVATE_AGENT7_NODE_IP} 'bash -s' < ../by-node/node-base.sh 


