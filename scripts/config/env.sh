# This script is used to set the environment variables that the setup scripts use to install
# the DC/OS cluster.  By default, the cluster is set with
#
# 1 Master Node
# 2 Public Agent Nodes
# 3 Private Agent Nodes
#
# Set each Node IP to fit your environment. You can also add additional Nodes as well to fit your
# environment. If you do, the various install scripts would need to be modified to include the additions.
# 
# NOTE: Set the IP's to whatever you like based on your network requirements.
#
# For a definition of DC/OS Node types, see
#
# See https://dcos.io/docs/1.9/overview/architecture/node-types/

# ------ MASTER NODE IPs -------

MASTER1_NODE_IP=10.1.1.11
export MASTER1_NODE_IP

# MASTER2_NODE_IP=<YOUR IP>
# export MASTER2_NODE_IP

# MASTER3_NODE_IP=<YOUR IP>
# export MASTER3_NODE_IP

# ------ PUBLIC AGENT NODE IPs -------

PUBLIC_AGENT1_NODE_IP=10.1.1.12
export PUBLIC_AGENT1_NODE_IP

PUBLIC_AGENT2_NODE_IP=10.1.1.13
export PUBLIC_AGENT2_NODE_IP

# PUBLIC_AGENT3_NODE_IP=<YOUR IP>
# export PUBLIC_AGENT3_NODE_IP

# PUBLIC_AGENT4_NODE_IP=<YOUR IP>
# export PUBLIC_AGENT4_NODE_IP

# PUBLIC_AGENT5_NODE_IP=<YOUR IP>
# export PUBLIC_AGENT5_NODE_IP

# ------ PRIVATE AGENT NODE IPs -------

PRIVATE_AGENT1_NODE_IP=10.1.1.14
export PRIVATE_AGENT1_NODE_IP

PRIVATE_AGENT2_NODE_IP=10.1.1.15
export PRIVATE_AGENT2_NODE_IP

PRIVATE_AGENT3_NODE_IP=10.1.1.16
export PRIVATE_AGENT3_NODE_IP

# PRIVATE_AGENT4_NODE_IP=<YOUR IP>
# export PRIVATE_AGENT4_NODE_IP

# PRIVATE_AGENT5_NODE_IP=<YOUR IP>
# export PRIVATE_AGENT5_NODE_IP

# PRIVATE_AGENT6_NODE_IP=<YOUR IP>
# export PRIVATE_AGENT6_NODE_IP

# PRIVATE_AGENT7_NODE_IP=<YOUR IP>
# export PRIVATE_AGENT7_NODE_IP

# ------ BOOT NODE IPs & PORT -------

BOOT_NODE_IP=10.1.1.10
export BOOT_NODE_IP

BOOT_NODE_PORT=9000
export BOOT_NODE_PORT

# ------ MISC. SETTINGS -------

# This password is used in the setup-keys.sh script to help with the automation of copying ssh keys to
# each node in the DC/OS cluster.  If you used this it is advisable to change the password for each node VM
# once the installation is complete.
#
# If you do not want to use this, that is ok as well. Modify the setup-key.sh script and simply answer each
# prompt to log in.
#
# NOTE: The password 'antsle' is a dummy password and should be changed to reflect your environment

SSHPWD='antsle'
export SSHPWD

# Device that can be mounted as an OverlayFS for Docker
# See the following link that talks about Recommendations and how OverlayFS avoids known issues with
# devicemapper in loop-lvm mode and allows containers to use docker-in-docker if they want.
#
# If you do not have a device that can be mapped, then comment go into the script node-base.sh and
# comment out the lines at the end of the file that make the file system and mount it.

OVERLAYFS=/dev/vdb
