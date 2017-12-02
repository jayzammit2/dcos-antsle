source ../config/env.sh
mkdir -p ~/bin 
cd ~/bin
curl -O https://downloads.dcos.io/binaries/cli/linux/x86-64/dcos-${DCOS_VERSION}/dcos 
chmod 755 ~/bin/dcos && cd -

dcos config set core.dcos_url http://${MASTER_NODE_ID}
# dcos auth login


