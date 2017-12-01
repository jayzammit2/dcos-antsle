# Install base requirements for all DC/OS Nodes can be found at the following link. This
# script includes most of the requirements outlined.
#
# https://dcos.io/docs/1.8/administration/installing/custom/system-requirements/
#

# ------ BEGIN DOCKER INSTALL & SETUP ------

# Docker must be installed on all bootstrap and cluster nodes.

tee /etc/yum.repos.d/docker.repo << '__EOF__' 
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
__EOF__

mkdir -p /etc/systemd/system/docker.service.d && tee /etc/systemd/system/docker.service.d/override.conf << '__EOF__'
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon --storage-driver=overlay --selinux-enabled=false -H fd://
__EOF__

yum install -y docker-engine-1.11.2

# add user 'root' to 'docker' group.

usermod -aG docker root


tee /etc/sudoers << '__EOF__'
nobody        ALL=(ALL)       NOPASSWD: /usr/bin/docker
__EOF__

# start the docker service and configure it to start at boot time.

systemctl start docker
systemctl enable docker

# check that the docker service is running.

systemctl status docker

# enable ip forwarding if not set.

sysctlfile="/etc/sysctl.conf"
ipv4cmd="net.ipv4.ip_forward = 1"
if [ -f "$sysctlfile" ]; then
  sysctl net.ipv4.ip_forward
  grep -qF "${ipv4cmd}" ${sysctlfile} || echo "${ipv4cmd}" >> ${sysctlfile}
  sysctl -p /etc/sysctl.conf
  sysctl net.ipv4.ip_forward
fi

# ------ END DOCKER INSTALL & SETUP ------

# ------ DATA COMPRESSION INSTALL & SETUP ------

# You must have the UnZip, GNU tar, and XZ Utils data compression utilities installed on your cluster nodes.

yum install -y epel-release
yum install -y tar ipset unzip wget curl xz ntp tree

# ------ END DATA COMPRESSION INSTALL & SETUP ------

# ------ NTP INSTALL & SETUP ------

# Network Time Protocol (NTP) must be enabled on all nodes for clock synchronization. By default, during DC/OS startup 
# you will receive an error if this is not enabled. You can check if NTP is enabled by running one of these commands, 
# depending on your OS and configuration:

timedatectl set-ntp true
service ntpd stop
ntpdate 0.centos.pool.ntp.org
service ntpd start
systemctl enable ntpd
ntptime

# ------ END NTP INSTALL & SETUP ------

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

# ------ DOCKER NGINX INSTALL  ------

# For advanced install only, install the Docker Nginx image with this command:

docker pull nginx

# ------ DOCKER NGINX INSTALL  ------

# On RHEL 7 and CentOS 7, firewalld must be stopped and disabled. It is a known Docker 
# issue that firewalld interacts poorly with Docker.

systemctl stop firewalld  
systemctl disable firewalld

systemctl disable dnsmasq 
systemctl stop dnsmasq
