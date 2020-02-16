#!/bin/bash

. ../common/common.sh

# sudo sh -c "sed -i.bak -e 's/^\s*version/#version/g' /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo \"            nameservers:\" >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo \"                addresses: [8.8.8.8,8.8.4.4]\" >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo \"    version: 2\" >> /etc/netplan/50-cloud-init.yaml"

echo "sudo -S netplan apply"
sudo -S netplan apply

