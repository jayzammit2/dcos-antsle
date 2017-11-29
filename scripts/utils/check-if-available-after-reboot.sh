# This script needs a lot of work.  For now it does what I need it to do. echo $ returns 0 for each ping when
# the service is back up

source ../config/env.sh

echo "Checking Master Node 1"
ping -c 1 ${MASTER1_NODE_IP} ; echo $?
# echo "Checking Master Node 2"
# ping -c 1 ${MASTER2_NODE_IP} ; echo $?
# echo "Checking Master Node 3"
# ping -c 1 ${MASTER3_NODE_IP} ; echo $?

echo "Checking Public Agent Node 1"
ping -c 1 ${PUBLIC_AGENT1_NODE_IP} ; echo $?
echo "Checking Public Agent Node 2"
ping -c 1 ${PUBLIC_AGENT2_NODE_IP} ; echo $?
# echo "Checking Public Agent Node 3"
# ping -c 1 ${PUBLIC_AGENT3_NODE_IP} ; echo $?
# echo "Checking Public Agent Node 4"
# ping -c 1 ${PUBLIC_AGENT4_NODE_IP} ; echo $?
# echo "Checking Public Agent Node 1"
# ping -c 1 ${PUBLIC_AGENT5_NODE_IP} ; echo $?

echo "Checking Private Agent Node 1"
ping -c 1 ${PRIVATE_AGENT1_NODE_IP} ; echo $?
echo "Checking Private Agent Node 2"
ping -c 1 ${PRIVATE_AGENT2_NODE_IP} ; echo $?
echo "Checking Private Agent Node 3"
ping -c 1 ${PRIVATE_AGENT3_NODE_IP} ; echo $?
# echo "Checking Private Agent Node 4"
# ping -c 1 ${PRIVATE_AGENT4_NODE_IP} ; echo $?
# echo "Checking Private Agent Node 5"
# ping -c 1 ${PRIVATE_AGENT5_NODE_IP} ; echo $?
# echo "Checking Private Agent Node 6"
# ping -c 1 ${PRIVATE_AGENT6_NODE_IP} ; echo $?
# echo "Checking Private Agent Node 7"
# ping -c 1 ${PRIVATE_AGENT7_NODE_IP} ; echo $?

