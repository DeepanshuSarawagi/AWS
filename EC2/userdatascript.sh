## This script is used to install httpd on a linux machine which launching an
## EC2 instance

#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html 
