# This script is used to set up the Private Agent Node. Details on DC/OS Advanced Installation can be found at
# the following link.
# 
# https://dcos.io/docs/1.7/administration/installing/custom/advanced/

# NOTE: The env.sh script must be present on the node in order to set the environment variables.  In the case
# of this install, env.sh is pushed to each agent node from the a-nodes/all-keys.sh script.  

source ./env.sh

curl -O http://${BOOT_NODE_IP}:${BOOT_NODE_PORT}/dcos_install.sh
chmod +x dcos_install.sh
./dcos_install.sh slave

