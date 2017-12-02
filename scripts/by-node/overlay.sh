# The OverlayFS storage driver avoids known issues with devicemapper in loop-lvm mode and allows containers
# to use docker-in-docker, if they want. See the following link for more information
#
# https://dcos.io/docs/1.8/administration/installing/custom/system-requirements/install-docker-centos/
#
# Additional information on the OverlayFS can be found at
#
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/7.2_release_notes/technology-preview-file_systems

tee /etc/modules-load.d/overlay.conf << '__EOF__'
overlay
__EOF__

# ------ CLUSTER PERMISSION INSTALL & SETUP ------
# On each of your cluster nodes, use the following command to:
# - Disable SELinux or set it to permissive mode.
# - Add nogroup to each of your Mesos masters and agents.
# - Reboot your cluster for the changes to take effect.

sed -i s/SELINUX=enforcing/SELINUX=permissive/g /etc/selinux/config
setenforce 0
sestatus | grep -i mode
groupadd nogroup

# ------ LOCALE REQUIREMENTS ------

tee /etc/environment << '__EOF__'
LC_ALL="en_US.utf8"
__EOF__

# ------ END LOCALE REQUIREMENTS ------
