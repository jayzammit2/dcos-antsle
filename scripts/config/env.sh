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

# ------ SET DCOS INSTALL VERSION ------

DCOS_VERSION=1.10

# ------ SET DCOS CLUSTER NAME  ------

DCOS_CLUSTER_NAME=my.dcos.cluster
export DCOS_CLUSTER_NAME

# ------ MASTER NODE IPs -------

MASTER1_NODE_IP=10.0.0.
export MASTER1_NODE_IP

# MASTER2_NODE_IP=<YOUR IP>
# export MASTER2_NODE_IP

# MASTER3_NODE_IP=<YOUR IP>
# export MASTER3_NODE_IP

# ------ PUBLIC AGENT NODE IPs -------

PUBLIC_AGENT1_NODE_IP=10.0.0.
export PUBLIC_AGENT1_NODE_IP

PUBLIC_AGENT2_NODE_IP=10.0.0.
export PUBLIC_AGENT2_NODE_IP

# PUBLIC_AGENT3_NODE_IP=<YOUR IP>
# export PUBLIC_AGENT3_NODE_IP

# PUBLIC_AGENT4_NODE_IP=<YOUR IP>
# export PUBLIC_AGENT4_NODE_IP

# PUBLIC_AGENT5_NODE_IP=<YOUR IP>
# export PUBLIC_AGENT5_NODE_IP

# ------ PRIVATE AGENT NODE IPs -------

PRIVATE_AGENT1_NODE_IP=10.0.0.
export PRIVATE_AGENT1_NODE_IP

PRIVATE_AGENT2_NODE_IP=10.0.0.
export PRIVATE_AGENT2_NODE_IP

PRIVATE_AGENT3_NODE_IP=10.0.0.
export PRIVATE_AGENT3_NODE_IP

PRIVATE_AGENT4_NODE_IP=<YOUR IP>
export PRIVATE_AGENT4_NODE_IP

PRIVATE_AGENT5_NODE_IP=<YOUR IP>
export PRIVATE_AGENT5_NODE_IP

# PRIVATE_AGENT6_NODE_IP=<YOUR IP>
# export PRIVATE_AGENT6_NODE_IP

# PRIVATE_AGENT7_NODE_IP=<YOUR IP>
# export PRIVATE_AGENT7_NODE_IP

# ------ BOOT NODE IPs & PORT -------

BOOT_NODE_IP=10.0.0.
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

NODEPW=start123@
export NODEPW

SSH_USER=root
export SSH_USER

DNS1=8.8.8.8
export DNS1

DNS2=8.8.4.4
export DNS2
