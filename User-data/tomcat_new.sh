   1  cd
    2  apt install telnet -y
    3  sudo apt install openjdk-8-jdk -y
    4  sudo groupadd tomcat
    5  sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
    6  cd /tmp
    7  curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.87/bin/apache-tomcat-8.5.87.tar.gz
    8  sudo mkdir /opt/tomcat
    9  sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1
   10  cd /opt/tomcat
   11  sudo chgrp -R tomcat /opt/tomcat
   12  sudo chmod -R g+r conf
   13  sudo chmod g+x conf
   14  sudo chown -R tomcat webapps/ work/ temp/ logs/
   15  sudo update-java-alternatives -l
   16  sudo nano /etc/systemd/system/tomcat.service

[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target


   17  cd
   18  git clone https://github.com/krushna1512/aws-project.git
   19  cp aws-project/target/vprofile-v2.war /opt/tomcat/webapps/
   20  cd /opt/tomcat/webapps/
   21  ll
   22  sudo systemctl daemon-reload
   23  sudo systemctl enable tomcat
   24  sudo systemctl start tomcat
   25  sudo systemctl status tomcat