# The DC/OS Boot node is not part of the overall cluster.  However, it is required for the advanced
# installaion,
#
# The advanced installation guide can be found at the following link
#
# https://dcos.io/docs/1.7/administration/installing/custom/advanced/

source ../config/env.sh

mkdir -p /opt/dcos-setup
cd /opt/dcos-setup

curl -O https://dcos.io/releases/${DCOS_VERSION}/dcos_generate_config.sh
# curl -O https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh
 
mkdir -p genconf
 
# Create an ip-detect script.
#
# In this step, you create an IP detect script to broadcast the IP address of each node 
# across the cluster. Each node in a DC/OS cluster has a unique IP address that is 
# used to communicate between nodes in the cluster. The IP detect script prints the
# unique IPv4 address of a node to STDOUT each time DC/OS is started on the node.


cat > genconf/ip-detect << '__EOF__'
#!/usr/bin/env bash
set -o nounset -o errexit
export PATH=/usr/sbin:/usr/bin:$PATH
echo $(ip addr show eth0 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
__EOF__
 
chmod 755 genconf/ip-detect
 
### VERY IMPORTANT: validate that the following ip-detect is working
### if not then follow https://dcos.io/docs/1.8/administration/installing/custom/advanced/
###   to get a working script, must work consistently on each & every node

./genconf/ip-detect
 
echo "---" > genconf/config.yaml
echo "agent_list:" >> genconf/config.yaml
echo "- ${PRIVATE_AGENT1_ID}” >> genconf/config.yaml
echo "- ${PRIVATE_AGENT2_ID}” >> genconf/config.yaml
echo "- ${PRIVATE_AGENT3_ID}” >> genconf/config.yaml
echo "public_agent_list:" >> genconf/config.yaml
echo "- ${PUBLIC_AGENT1_ID}” >> genconf/config.yaml
echo "- ${PUBLIC_AGENT1_ID}” >> genconf/config.yaml
echo "master_list:" >> genconf/config.yaml
echo "- ${MASTER1_NODE_IP}" >> genconf/config.yaml
echo "bootstrap_url: 'http://${BOOT_NODE_IP}:${BOOT_NODE_PORT}” >> genconf/config.yaml
echo "cluster_name: 'dcos.cluster'" >> genconf/config.yaml
echo "log_directory: genconf/logs" >> genconf/config.yaml
echo "exhibitor_storage_backend: static" >> genconf/config.yaml
echo "master_discovery: static" >> genconf/config.yaml
echo "process_timeout: 10000" >> genconf/config.yaml
echo "resolvers:" >> genconf/config.yaml
echo "- ${DNS1}“ >> genconf/config.yaml
echo "- ${DNS2}“ >> genconf/config.yaml
echo "ssh_key_path: genconf/ssh-key" >> genconf/config.yaml
echo "ssh_port: '22'" >> genconf/config.yaml
echo "ssh_user: ${SSH_USER}” >> genconf/config.yaml


: '
echo "Creating config.yaml"
cat > genconf/config.yaml << '__EOF__'
---
agent_list:
- 10.1.1.14
- 10.1.1.15
- 10.1.1.16
public_agent_list:
- 10.1.1.12
- 10.1.1.13
master_list:
- 10.1.1.11
bootstrap_url: 'http://10.1.1.10:9000'
cluster_name: 'dcos.cluster'
log_directory: genconf/logs
exhibitor_storage_backend: static
master_discovery: static
process_timeout: 10000
resolvers:
- 8.8.8.8
- 8.8.4.4
ssh_key_path: genconf/ssh-key
ssh_port: '22'
ssh_user: root
__EOF__
'

# Copy the ssh keys that each node will use to securly interact with each other to the genconf config directory.
# See advanced installation documentation

cp $HOME/.ssh/id_rsa genconf/ssh-key

chmod +x dcos_generate_config.sh

# Run the DC/OS installer shell script to generate a customized DC/OS build file. 
# The setup script extracts a Docker container that uses the generic DC/OS install 
# files to create customized DC/OS build files for your cluster. The build files are 
# output to ./genconf/serve/

bash dcos_generate_config.sh

# From your home directory, run this command to host the DC/OS install package
# through an NGINX Docker container. For <your-port>, specify the port value 
# that is used in the bootstrap_url.

docker pull nginx
docker run -d --restart=unless-stopped -p ${BOOT_NODE_PORT}:80 -v $PWD/genconf/serve:/usr/share/nginx/html:ro nginx
docker ps


