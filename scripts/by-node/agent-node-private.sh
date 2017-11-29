mkdir -p /opt/dcos-setup
mv ~/env.sh /opt/dcos-setup
cd /opt/dcos-setup
source ./env.sh

curl -O http://${BOOT_NODE_IP}:${BOOT_NODE_PORT}/dcos_install.sh
chmod +x dcos_install.sh
./dcos_install.sh slave

