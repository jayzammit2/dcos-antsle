# This is a utility to check to see if all the nodes in the cluster are back up after a re-boot

source ../config/env.sh

#
# ------ CHECK IF MASTER NODES ARE BACK UP AND RUNNING ------
#

echo "Checking Master Node 1"
ping -c 1 ${MASTER1_NODE_IP} > /dev/null && echo 'Master Node 1 at IP' ${MASTER1_NODE_IP} 'is back up' || echo 'Master Node 1 at IP' ${MASTER1_NODE_IP} 'is still rebooting'

# echo "Checking Master Node 2"
# ping -c 1 ${MASTER2_NODE_IP} > /dev/null && echo 'Master Node 2 at IP' ${MASTER2_NODE_IP} 'is back up' || echo 'Master Node 2 at IP' ${MASTER2_NODE_IP} 'is still rebooting'


# echo "Checking Master Node 3"
# ping -c 1 ${MASTER3_NODE_IP} > /dev/null && echo 'Master Node 3 at IP' ${MASTER3_NODE_IP} 'is back up' || echo 'Master Node 3 at IP' ${MASTER3_NODE_IP} 'is still rebooting'

#
# ------ CHECK IF PUBLIC AGENT NODES ARE BACK UP AND RUNNING ------
#

echo "Checking Public Agent Node 1"
ping -c 1 ${PUBLIC_AGENT1_NODE_IP} > /dev/null && echo 'Public Agent Node 1 at IP' ${PUBLIC_AGENT1_NODE_IP} 'is back up' || echo 'Public Agent Node 1 at IP' ${PUBLIC_AGENT1_NODE_IP} 'is still rebooting'


echo "Checking Public Agent Node 2"
ping -c 1 ${PUBLIC_AGENT2_NODE_IP} > /dev/null && echo 'Public Agent Node 2 at IP' ${PUBLIC_AGENT2_NODE_IP} 'is back up' || echo 'Public Agent Node 2 at IP' ${PUBLIC_AGENT2_NODE_IP} 'is still rebooting'


# echo "Checking Public Agent Node 3"
# ping -c 1 ${PUBLIC_AGENT3_NODE_IP} > /dev/null && echo 'Public Agent Node 3 at IP' ${PUBLIC_AGENT3_NODE_IP} 'is back up' || echo 'Public Agent Node 3 at IP' ${PUBLIC_AGENT3_NODE_IP} 'is still rebooting'


# echo "Checking Public Agent Node 4"
# ping -c 1 ${PUBLIC_AGENT4_NODE_IP} > /dev/null && echo 'Public Agent Node 4 at IP' ${PUBLIC_AGENT4_NODE_IP} 'is back up' || echo 'Public Agent Node 4 at IP' ${PUBLIC_AGENT4_NODE_IP} 'is still rebooting'


# echo "Checking Public Agent Node 5"
# ping -c 1 ${PUBLIC_AGENT5_NODE_IP} > /dev/null && echo 'Public Agent Node 5 at IP' ${PUBLIC_AGENT5_NODE_IP} 'is back up' || echo 'Public Agent Node 5 at IP' ${PUBLIC_AGENT5_NODE_IP} 'is still rebooting'

#
# ------ CHECK IF PRIVATE AGENT NODES ARE BACK UP AND RUNNING ------
#

echo "Checking Private Agent Node 1"
ping -c 1 ${PRIVATE_AGENT1_NODE_IP} > /dev/null && echo 'Private Agent Node 1 at IP' ${PRIVATE_AGENT1_NODE_IP} 'is back up' || echo 'Private Agent Node 1 at IP' ${PRIVATE_AGENT1_NODE_IP} 'is still rebooting'


echo "Checking Private Agent Node 2"
ping -c 1 ${PRIVATE_AGENT2_NODE_IP} > /dev/null && echo 'Private Agent Node 2 at IP' ${PRIVATE_AGENT2_NODE_IP} 'is back up' || echo 'Private Agent Node 2 at IP' ${PRIVATE_AGENT2_NODE_IP} 'is still rebooting'


echo "Checking Private Agent Node 3"
ping -c 1 ${PRIVATE_AGENT3_NODE_IP} > /dev/null && echo 'Private Agent Node 3 at IP' ${PRIVATE_AGENT3_NODE_IP} 'is back up' || echo 'Private Agent Node 3 at IP' ${PRIVATE_AGENT3_NODE_IP} 'is still rebooting'


# echo "Checking Private Agent Node 4"
# ping -c 1 ${PRIVATE_AGENT4_NODE_IP} > /dev/null && echo 'Private Agent Node 4 at IP' ${PRIVATE_AGENT4_NODE_IP} 'is back up' || echo 'Private Agent Node 4 at IP' ${PRIVATE_AGENT4_NODE_IP} 'is still rebooting'


# echo "Checking Private Agent Node 5"
# ping -c 1 ${PRIVATE_AGENT5_NODE_IP} > /dev/null && echo 'Private Agent Node 5 at IP' ${PRIVATE_AGENT5_NODE_IP} 'is back up' || echo 'Private Agent Node 5 at IP' ${PRIVATE_AGENT5_NODE_IP} 'is still rebooting'

o "Checking Private Agent Node 6"
# ping -c 1 ${PRIVATE_AGENT6_NODE_IP} > /dev/null && echo 'Private Agent Node 6 at IP' ${PRIVATE_AGENT6_NODE_IP} 'is back up' || echo 'Private Agent Node 6 at IP' ${PRIVATE_AGENT6_NODE_IP} 'is still rebooting'

# echo "Checking Private Agent Node 7"
# ping -c 1 ${PRIVATE_AGENT7_NODE_IP} > /dev/null && echo 'Private Agent Node 7 at IP' ${PRIVATE_AGENT7_NODE_IP} 'is back up' || echo 'Private Agent Node 7 at IP' ${PRIVATE_AGENT7_NODE_IP} 'is still rebooting'

echo "Done"
