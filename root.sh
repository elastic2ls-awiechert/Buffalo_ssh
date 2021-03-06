#!/bin/sh

#  Change root password
./execute_cmd.sh "(echo Youradminpassword;echo Youradminpassword)|passwd"

#  Enable SFTP
./execute_cmd.sh "sed -i 's/SUPPORT_SFTP=0/SUPPORT_SFTP=1/g' /etc/execute_cmd.sh_feature"

#  Enable Root login
./execute_cmd.sh "sed -i 's/#PermitRootLogin/PermitRootLogin /g' /etc/sshd_config"
./execute_cmd.sh "sed -i 's/#PubkeyAuthentication/PubkeyAuthentication /' /etc/sshd_config"
./execute_cmd.sh "sed -i 's/UsePAM yes/UsePAM no' /etc/sshd_config"

#  Enable SFTP/SSH
./execute_cmd.sh "/etc/init.d/sshd.sh stop"
./execute_cmd.sh "/etc/init.d/sshd.sh start"
