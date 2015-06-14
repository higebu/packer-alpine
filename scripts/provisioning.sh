#!/bin/sh -x

apk --update add open-vm-tools
rm -rf /var/cache/apk/*
rc-update -u add open-vm-tools default
service open-vm-tools start
vmware-toolbox-cmd timesync enable

rm -rf /etc/ssh/ssh_host_*
cat <<EOF >> /etc/ssh/sshd_config
UseDNS no
EOF
