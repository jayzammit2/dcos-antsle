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

