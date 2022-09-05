#!/bin/bash
#add fix to exercise5-server1 here
sudo su - vagrant -c "ssh-keygen -t rsa -f /vagrant/id_rsa -q -N ''"
sudo su - vagrant -c "cp /vagrant/id_rsa /home/vagrant/.ssh/id_rsa"
sudo su - vagrant -c "chmod 0600 /home/vagrant/.ssh/id_rsa"
sudo su - vagrant -c "cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys"
sudo su - vagrant -c "chmod 0600 ~/.ssh/authorized_keys"
echo "Host *" >> /home/vagrant/.ssh/config
echo "StrictHostKeyChecking no" >> /home/vagrant/.ssh/config
echo "UserKnownHostsFile=/dev/null" >> /home/vagrant/.ssh/config