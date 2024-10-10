#!/bin/bash

#update the packages
sudo apt update

#Installation of Java
#Jenkins requires Java to run, yet not all Linux distributions include Java by default. Additionally, not all Java versions are compatible with Jenkins.
#There are multiple Java implementations which you can use. OpenJDK is the most popular one at the moment, we will use it in this guide.
#Update the Debian apt repositories, install OpenJDK 17, and check the installation with the commands:

#install the java dependencies
sudo apt install fontconfig openjdk-17-jre

# to check if the java has been installed or not 
java -version
#openjdk version "17.0.8" 2023-07-18
#OpenJDK Runtime Environment (build 17.0.8+7-Debian-1deb12u1)
#OpenJDK 64-Bit Server VM (build 17.0.8+7-Debian-1deb12u1, mixed mode, sharing)

# Run this commands to install the jenkins repository and to generate the key 
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

#Beginning with Jenkins 2.335 and Jenkins 2.332.1, the package is configured with systemd rather than the older System V init. 
#See the DigitalOcean community systemd tutorial to better understand the benefits of systemd and the systemctl command.
  
#The package installation will:
#Setup Jenkins as a daemon launched on start. Run **systemctl cat jenkins** for more details.
#Create a ‘jenkins’ user to run this service.
#Direct console log output to **systemd-journald**. Run **journalctl -u jenkins.service** if you are troubleshooting Jenkins.
#Populate **/lib/systemd/system/jenkins.service** with configuration parameters for the launch, e.g **JENKINS_HOME**
#Set Jenkins to listen on port **8080**. Access this port with your browser to start configuration.  

#If Jenkins fails to start because a port is in use, run systemctl edit jenkins and add the following:

#[Service]
#Environment="JENKINS_PORT=8081"

#Here, "8081" was chosen but you can put another port available.
  
sudo apt-get update

sudo apt-get install jenkins

#Why use **apt** and not **apt-get** or another command? The apt command has been available since 2014. 
#It has a command structure that is similar to **apt-get** but was created to be a more pleasant experience for typical users. 
#Simple software management tasks like install, search and remove are easier with **apt**.

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo systemctl status jenkins

