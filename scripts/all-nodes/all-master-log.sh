source ../config/env.sh

if [ $1 -eq 1 ]
then
ssh ${MASTER1_NODE_IP} 'bash -s' < ../utils/check-master-log.sh 
fi

if [ $1 -eq 2 ]
then
ssh ${MASTER2_NODE_IP} 'bash -s' < ../utils/check-master-log.sh 
fi

if [ $1 -eq 3 ]
then
ssh ${MASTER3_NODE_IP} 'bash -s' < ../utils/check-master-log.sh 
fi
