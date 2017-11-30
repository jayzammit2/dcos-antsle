source ../config/env.sh

if [ $1 -eq 1 ]
ssh ${MASTER1_NODE_IP} 'bash -s' < ../utils/check-master-log.sh 
then
fi

if [ $1 -eq 2 ]
ssh ${MASTER2_NODE_IP} 'bash -s' < ../utils/check-master-log.sh 
then
fi

if [ $1 -eq 3 ]
ssh ${MASTER3_NODE_IP} 'bash -s' < ../utils/check-master-log.sh 
then
fi
