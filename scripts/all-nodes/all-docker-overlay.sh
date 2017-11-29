source ../config/env.sh
../by-node/docker-overlay.sh &
ssh ${MASTER1_NODE_IP} 'bash -s' < ../by-node/docker-overlay.sh &
ssh ${PUBLIC_AGENT1_NODE_IP} 'bash -s' < ../by-node/docker-overlay.sh &
ssh ${PUBLIC_AGENT2_NODE_IP} 'bash -s' < ../by-node/docker-overlay.sh &
ssh ${PRIVATE_AGENT1_NODE_IP} 'bash -s' < ../by-node/docker-overlay.sh &
ssh ${PRIVATE_AGENT2_NODE_IP} 'bash -s' < ../by-node/docker-overlay.sh &
ssh ${PRIVATE_AGENT3_NODE_IP} 'bash -s' < ../by-node/docker-overlay.sh &
