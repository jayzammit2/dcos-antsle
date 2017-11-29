mkdir -p /opt/dcos-setup
cd /opt/dcos-setup

curl -O https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh
 
mkdir -p genconf
 
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
cluster_name: 'antsle.dcos'
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

cp $HOME/.ssh/id_rsa genconf/ssh-key

chmod +x dcos_generate_config.sh
bash dcos_generate_config.sh

docker pull nginx
docker run -d --restart=unless-stopped -p 9000:80 -v $PWD/genconf/serve:/usr/share/nginx/html:ro nginx
docker ps


