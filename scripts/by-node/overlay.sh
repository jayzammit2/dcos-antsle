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

