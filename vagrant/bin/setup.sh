#!/bin/bash
sudo sed -i -e "/^#* *PasswordAuthentication/ s/#* *PasswordAuthentication .*/PasswordAuthentication no/g" /etc/ssh/sshd_config
sudo service ssh restart
