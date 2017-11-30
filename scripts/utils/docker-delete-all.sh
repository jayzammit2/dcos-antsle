# Utility to stop and clean up docker processes. 
#
# This script is not used for the install but can be handy when troubleshooting. 
#
# I primarily used the script when something went wrong on the boot node and needed to rerun the bood-node.sh script.
# The reason is that the boot-node script starts a docker container that is used by the Master and Agent nodes to pull
# the install script and self configure themselves. 

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
