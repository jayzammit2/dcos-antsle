source ../config/env.sh
ssh ${PRIVATE_AGENT1_NODE_IP} 'bash -s' < ../by-node/agent-node-private.sh &
ssh ${PRIVATE_AGENT2_NODE_IP} 'bash -s' < ../by-node/agent-node-private.sh &
ssh ${PRIVATE_AGENT3_NODE_IP} 'bash -s' < ../by-node/agent-node-private.sh &
ssh ${PRIVATE_AGENT4_NODE_IP} 'bash -s' < ../by-node/agent-node-private.sh &
ssh ${PRIVATE_AGENT5_NODE_IP} 'bash -s' < ../by-node/agent-node-private.sh &
ssh ${PRIVATE_AGENT6_NODE_IP} 'bash -s' < ../by-node/agent-node-private.sh &
ssh ${PRIVATE_AGENT7_NODE_IP} 'bash -s' < ../by-node/agent-node-private.sh &

