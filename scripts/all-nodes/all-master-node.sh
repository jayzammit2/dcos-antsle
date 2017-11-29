source ../config/env.sh
ssh ${MASTER1_NODE_IP} 'bash -s' < ../by-node/master-node.sh &
# ssh ${MASTER2_NODE_IP} 'bash -s' < ../by-node/master-node.sh &
# ssh ${MASTER3_NODE_IP} 'bash -s' < ../by-node/master-node.sh &

