source ../config/env.sh
ssh ${MASTER1_NODE_IP} 'bash -s' < ../utils/check-master-log.sh 
