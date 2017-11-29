# The OverlayFS storage driver avoids known issues with devicemapper in loop-lvm mode and allows containers
# to use docker-in-docker, if they want. See the following link for more information
#
# https://dcos.io/docs/1.8/administration/installing/custom/system-requirements/install-docker-centos/
#
# Additional information on the OverlayFS can be found at
#
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/7.2_release_notes/technology-preview-file_systems

source ../config/env.sh

tee /etc/modules-load.d/overlay.conf << '__EOF__'
overlay
__EOF__

# ------ MOUNT OVERLAY FILE SYSTEM ------
#
# NOTE: Comment out if you do not have a device to make an overlay filesystem on and mount.  If
# you do, set the OVERLAYFS variable in env.sh.  The default is set to /dev/vdb

mkfs -t xfs -n ftype=1 ${OVERLATFS}
mkdir /mnt/mesos
mount -t xfs ${OVERLATFS} /mnt/mesos/
xfs_info /dev/vdb | grep ftype

tee /etc/fstab << '__EOF__'
/dev/vdb /mnt/mesos xfs defaults 1 2
__EOF__

df -h

# ------ END MOUNT OVERLAY FILE SYSTEM ------

