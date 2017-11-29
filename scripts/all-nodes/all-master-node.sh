source ../config/env.sh
cat ../by-node/master-node.sh | ssh ${MASTER1_NODE_IP}  'bash -' &
