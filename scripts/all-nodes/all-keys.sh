# This script is used to generate the ssh key that will then be used by all nodes in the DC/OS cluster
# to securly communicate with each other.

source ../config/env.sh

# SSHPass is a tiny utility, which allows you to provide the ssh password without using the prompt. This is very helpful for scripting.

yum install -y sshpass

# Disable SSH Host Key Checking
# By default, the SSH client verifies the identity of the host to which it connects.
# If the remote host key is unknown to your SSH client, you would be asked to accept it by typing “yes” or “no”.
# This could cause a trouble when running from script that automatically connects to a remote host over SSH protocol.

tee -a /etc/ssh/ssh_config << '__EOF__'
StrictHostKeyChecking no
__EOF__

# Generate ssh key that will be used by all DC/OS cluster nodes to be able to securly communicate with each other
ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''

# Copy ssh key to Master Nodes

sshpass -p ${NODEPW} ssh-copy-id ${MASTER1_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${MASTER2_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${MASTER3_NODE_IP} 

# Copy ssh key to Public Agent Nodes

sshpass -p ${NODEPW} ssh-copy-id ${PUBLIC_AGENT1_NODE_IP} 
sshpass -p ${NODEPW} ssh-copy-id ${PUBLIC_AGENT2_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${PUBLIC_AGENT3_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${PUBLIC_AGENT4_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${PUBLIC_AGENT5_NODE_IP} 

# Copy ssh key to Public Agent Nodes

sshpass -p ${NODEPW} ssh-copy-id ${PRIVATE_AGENT1_NODE_IP} 
sshpass -p ${NODEPW} ssh-copy-id ${PRIVATE_AGENT2_NODE_IP} 
sshpass -p ${NODEPW} ssh-copy-id ${PRIVATE_AGENT3_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${PRIVATE_AGENT4_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${PRIVATE_AGENT5_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${PRIVATE_AGENT6_NODE_IP} 
# sshpass -p ${NODEPW} ssh-copy-id ${PRIVATE_AGENT7_NODE_IP} 

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
scp ../config/env.sh ${PUBLIC_AGENT2_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PUBLIC_AGENT3_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PUBLIC_AGENT4_NODE_IP}:~/env.sh
# scp ../config/env.sh ${PUBLIC_AGENT5_NODE_IP}:~/env.sh

# Copy env.sh script to Private Agent Nodes

scp ../config/env.sh ${PRIVATE_AGENT1_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT2_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT3_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT4_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT5_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT6_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT7_NODE_IP}:~/env.sh

