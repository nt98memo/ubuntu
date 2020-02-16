#!/bin/bash

default_user=user1
ssh_port=2200

# DNS
# sudo sh -c "sed -i.bak -e 's/^\s*version/#version/g' /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo \"            nameservers:\" >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo \"                addresses: [8.8.8.8,8.8.4.4]\" >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo \"    version: 2\" >> /etc/netplan/50-cloud-init.yaml"

echo "sudo -S netplan apply"
sudo -S netplan apply


# apt
echo "sudo -S apt -y update"
sudo -S apt -y update
sudo -S ufw enable
sudo -S apt -y install lsof
sudo -S apt -y install policycoreutils-python
sudo -S apt -y install iproute
sudo -S apt -y install wget
sudo -S apt -y install gcc

# ssh
# sudo sh -c "sed -i.bak -e 's/^\s*PasswordAuthentication/#PasswordAuthentication/g' -e 's/^\s*PermitRootLogin/#PermitRootLogin/g' -e 's/^\s*Port/#Port/g' /etc/ssh/sshd_config"
# sudo sh -c "echo 'Port ${ssh_port}' >> /etc/ssh/sshd_config"
# sudo sh -c "echo 'PermitRootLogin no' >> /etc/ssh/sshd_config"
# sudo sh -c "echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config"

sudo -S semanage port -a -t ssh_port_t -p tcp ${ssh_port}
echo "sudo -S systemctl restart sshd.service"
sudo -S systemctl restart sshd.service

# firewalld
sudo -S ufw default DENY
sudo -S ufw allow ${ssh_port}
sudo -S ufw reload
sudo -S ufw enable


# user
sudo -S useradd ${default_user}
sudo -S passwd ${default_user}
sudo -S gpasswd -a ${default_user} wheel
