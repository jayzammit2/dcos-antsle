# The DC/OS Boot node is not part of the overall cluster.  However, it is required for the advanced
# installaion,
#
# The advanced installation guide can be found at the following link
#
# https://dcos.io/docs/1.7/administration/installing/custom/advanced/

source ../config/env.sh

cd /opt/dcos-setup

bash dcos_generate_config.sh

# From your home directory, run this command to host the DC/OS install package
# through an NGINX Docker container. For <your-port>, specify the port value 
# that is used in the bootstrap_url.

docker pull nginx
docker run -d --restart=unless-stopped -p ${BOOT_NODE_PORT}:80 -v $PWD/genconf/serve:/usr/share/nginx/html:ro nginx
docker ps


