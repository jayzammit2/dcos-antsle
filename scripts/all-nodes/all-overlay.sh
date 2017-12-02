# Docker prefers the OverlayFS storage driver. The OverlayFS avoids known issues with devicemapper in loop-lvm mode 
# and allows containers to use docker-in-docker, if they want. This requirement is outlined in the following link
#
# https://dcos.io/docs/1.7/administration/installing/custom/system-requirements/install-docker-centos/

source ../config/env.sh

ssh ${MASTER1_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
# ssh ${MASTER2_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
# ssh ${MASTER3_NODE_IP} 'bash -s' < ../by-node/overlay.sh 

ssh ${PUBLIC_AGENT1_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
ssh ${PUBLIC_AGENT2_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
# ssh ${PUBLIC_AGENT3_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
# ssh ${PUBLIC_AGENT4_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
# ssh ${PUBLIC_AGENT5_NODE_IP} 'bash -s' < ../by-node/overlay.sh 

ssh ${PRIVATE_AGENT1_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
ssh ${PRIVATE_AGENT2_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
ssh ${PRIVATE_AGENT3_NODE_IP} 'bash -s' < ../by-node/overlay.sh
# ssh ${PRIVATE_AGENT4_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
# ssh ${PRIVATE_AGENT5_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
# ssh ${PRIVATE_AGENT6_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
# ssh ${PRIVATE_AGENT7_NODE_IP} 'bash -s' < ../by-node/overlay.sh 
