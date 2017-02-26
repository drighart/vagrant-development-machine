# Install Vagrant and run a development machine as Virtual Machine

Go to https://www.vagrantup.com/downloads.html and download and use the installer to install Vagrant (for instance in the folder C:\vagrant-config). Set the environment variable VAGRANT_HOME to another folder (NOT the installation folder because this is readonly). This folder is used to put in the virtual boxes and other stuff.

Go to https://www.virtualbox.org/wiki/Downloads and download and use the installer to install VirtualBox.

The following packages are installed:
- Java JDK 8
- Gradle
- Maven
- IntelliJ Idea
- Docker
- Git
- Helm
- Kubectl

Optional, in the Vagrantfile the following packages can be enabled by removing the hash:
- Libsodium
- Wildfly

Username is *vagrant* and password is also *vagrant*

The following mounts are created:
- /vagrant which is mounted to the folder where the Vagrantfile is in. 
- /certificates is mounted to C:\certificates and should contain all certificates like for SSH, Kubectl and AWS. 
Check out the Vagrantfile and add more share if you want to.