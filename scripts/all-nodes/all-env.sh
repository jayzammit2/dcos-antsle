# This script is used to generate the ssh key that will then be used by all nodes in the DC/OS cluster
# to securly communicate with each other.

source ../config/env.sh

# Copy env.sh to each nodes for later instalation and configuration.  This 
# may not be the best script to include this code, but it was the most convenient.
# Some of the later instalation scripts are run remotely and they depend on the
# environment variables being set locally. The scripts include
# 1) agent-node-private.sh
# 2) agent-node-public.sh
# 3) master-node.sh
# 4) mount-overlay.sh

# Copy env.sh script to Master Nodes

scp ../config/env.sh ${MASTER1_NODE_IP}:~/env.sh
# scp ../config/env.sh ${MASTER1_NODE_IP}:~/env.sh
# scp ../config/env.sh ${MASTER1_NODE_IP}:~/env.sh

# Copy env.sh script to Public Agent Nodes

scp ../config/env.sh ${PUBLIC_AGENT1_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PUBLIC_AGENT2_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PUBLIC_AGENT3_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PUBLIC_AGENT4_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PUBLIC_AGENT5_NODE_IP}:~/env.sh

# Copy env.sh script to Private Agent Nodes

scp ../config/env.sh ${PRIVATE_AGENT1_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT2_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT3_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PRIVATE_AGENT4_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PRIVATE_AGENT5_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PRIVATE_AGENT6_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PRIVATE_AGENT7_NODE_IP}:~/env.sh

