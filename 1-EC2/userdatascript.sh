## This script is used to install httpd on a linux machine which launching an
## EC2 instance

#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html


#!/bin/bash
# Enable the epel-release
sudo amazon-linux-extras install epel
# Install and start Apache web server
sudo yum install -y httpd php
# Start the httpd service
service httpd start
# Install CPU stress test tool
sudo yum install -y stress


# Command to add load to the JVM
stress --cpu 2 --io 1 --vm 1 --vm-bytes 128M --timeout 5m 
