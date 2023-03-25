yum install nano -y
sudo update-crypto-policies --set LEGACY
sudo reboot
sudo dnf -y install wget
wget https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh -O rabbitmq_script.rpm.sh
chmod +x  rabbitmq_script.rpm.sh
sudo os=el dist=8 ./rabbitmq_script.rpm.sh
wget https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh -O erlang_script.rpm.sh
chmod +x  erlang_script.rpm.sh
sudo os=el dist=8 ./erlang_script.rpm.sh
sudo yum update -y
sudo yum install socat logrotate -y
sudo yum install rabbitmq-server erlang -y
sudo systemctl enable --now rabbitmq-server
sudo systemct status rabbitmq-server
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server~
service rabbitmq-server restart