source ../config/env.sh
yum install -y sshpass

tee -a /etc/ssh/ssh_config << '__EOF__'
StrictHostKeyChecking no
__EOF__

ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''

sshpass -p ${SSHPWD} ssh-copy-id ${MASTER1_NODE_IP} 
sshpass -p ${SSHPWD} ssh-copy-id ${PUBLIC_AGENT1_NODE_IP} 
sshpass -p ${SSHPWD} ssh-copy-id ${PUBLIC_AGENT2_NODE_IP} 
sshpass -p ${SSHPWD} ssh-copy-id ${PRIVATE_AGENT1_NODE_IP} 
sshpass -p ${SSHPWD} ssh-copy-id ${PRIVATE_AGENT2_NODE_IP} 
sshpass -p ${SSHPWD} ssh-copy-id ${PRIVATE_AGENT3_NODE_IP} 

# Copy env.sh to each nodes for later instalation and configuration.  This 
# may not be the best script to include this code, but it was the most convenient.
# Some of the later instalation scripts are run remotely and they depend on the
# environment variables being set locally. The scripts include
# 1) agent-node-private.sh
# 2) agent-node-public.sh
# 3) master-node.sh
# 4) mount-overlay.sh

scp ../config/env.sh ${MASTER1_NODE_IP}:~/env.sh
scp ../config/env.sh ${PUBLIC_AGENT1_NODE_IP}:~/env.sh
scp ../config/env.sh ${PUBLIC_AGENT2_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT1_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT2_NODE_IP}:~/env.sh
scp ../config/env.sh ${PRIVATE_AGENT3_NODE_IP}:~/env.sh

