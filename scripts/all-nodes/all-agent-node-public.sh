source ../config/env.sh
ssh ${PUBLIC_AGENT1_NODE_IP} 'bash -s' < ../by-node/agent-node-public.sh &
ssh ${PUBLIC_AGENT2_NODE_IP} 'bash -s' < ../by-node/agent-node-public.sh &
# ssh ${PUBLIC_AGENT3_NODE_IP} 'bash -s' < ../by-node/agent-node-public.sh &
# ssh ${PUBLIC_AGENT4_NODE_IP} 'bash -s' < ../by-node/agent-node-public.sh &
# ssh ${PUBLIC_AGENT5_NODE_IP} 'bash -s' < ../by-node/agent-node-public.sh &

