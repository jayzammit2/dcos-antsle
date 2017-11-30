# Utility to stop and clean up docker processes. Not needed for the install but can be handy when troubleshooting
# I primarily used this script when something went wrong on the boot node, and I needed to rerun the bood-node.sh script.
# The reason being is that the script started a docker container that was then used by the Master and Agent nodes to pull
# the install script and self configure themselves. 

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
