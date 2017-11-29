source ../config/env.sh
cat ../by-node/agent-node-private.sh | ssh ${PRIVATE_AGENT1_NODE_IP}  'bash -' &
cat ../by-node/agent-node-private.sh | ssh ${PRIVATE_AGENT2_NODE_IP}  'bash -' &
cat ../by-node/agent-node-private.sh | ssh ${PRIVATE_AGENT3_NODE_IP}  'bash -' &
