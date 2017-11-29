source ../config/env.sh
cat ../by-node/agent-node-public.sh | ssh ${PUBLIC_AGENT1_NODE_IP}  'bash -' &
cat ../by-node/agent-node-public.sh | ssh ${PUBLIC_AGENT2_NODE_IP}  'bash -' &
