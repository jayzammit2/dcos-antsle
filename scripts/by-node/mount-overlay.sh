# NOT READY TO BE RUN - CAUSES SOME ISSUES
#
# The OverlayFS storage driver avoids known issues with devicemapper in loop-lvm mode and allows containers
# to use docker-in-docker, if they want. See the following link for more information
#
# https://dcos.io/docs/1.8/administration/installing/custom/system-requirements/install-docker-centos/
#
# Additional information on the OverlayFS can be found at
#
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/7.2_release_notes/technology-preview-file_systems

# ------ MOUNT OVERLAY FILE SYSTEM ------
#
# NOTE: Comment out if you do not have a device to make an overlay filesystem on and mount.  If
# you do, set the OVERLAYFS variable in env.sh.  The default is set to /dev/vdb

mkdir -p /opt/dcos-setup
mv ~/env.sh /opt/dcos-setup
cd /opt/dcos-setup
source ./env.sh

mkfs -t xfs -n ftype=1 ${OVERLAYFS} 
mkdir /var/lib/docker
mount -t xfs ${OVERLAYFS} /var/lib/docker
xfs_info ${OVERLAYFS} | grep ftype

# NOTE: Need to change the tee syntex so that I can use the OVERLAYFS env variable instead of hard coading /dev/vdb
tee /etc/fstab << '__EOF__'
/dev/vdb	/var/lib/docker 	xfs	defaults	0	2
__EOF__

# Set Runtime directory and storage driver
# I have this commented out because various docker parameters are already set in the node-base.sh script. You will see a line
# where override.conf is set with ExecStart=/usr/bin/docker daemon --storage-driver=overlay -H fd://.  If yo modify this line
# and prefer to set this in daemon.json, you are free to do so

# mkdir -p /etc/docker
# touch /etc/docker/daemon.json
# tee /etc/docker/daemon.json << '__EOF__'
# {
#   "storage-driver": "overlay"
# }
# __EOF__

df -h

# ------ END MOUNT OVERLAY FILE SYSTEM ------

