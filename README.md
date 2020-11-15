# ft_services

![logo](https://d33wubrfki0l68.cloudfront.net/eb4e41f2cba0cbc8d119f8d0eb2bd6935cb78fc8/ba7d6/images/community/kubernetes-community-final-02.jpg)

> The project consists of implementing an infrastructure with different services using kubernetes. School project done at 42Madrid.

### Learn Build Teach 🚀

> As I get better, you get better! As I learn, you learn!

---

### Index 📋
You're sections headers will be used to reference location of destination.

- [Description](#description)
	- [Components 🛠️](#components)
	- [Technologies](#technologies)
	- [Technical Considerations](#technical-considerations)
	- [Ports](#ports)
- [How To Use](#how-to-use)
	- [Installation 🔧](#installation)
	- [Usage 📦](#usage)
- [References 📌](#references)
- [License 📄](#license)
- [Author Info  ✒️](#author-info)

---

## Description

You will discover cluster deployment and management with Kubernetes. You are going to do what is called "clustering".
The project consists of implementing an infrastructure with different services. For this, we will use ```Kubernetes```, therefore, we will install a cluster that groups several service containers. Each service works in a dedicated container, and the containers have the same name as the associated service. For performance reasons the containers are built on ```Alpine Linux```. To complete the project we need the next components:

### Components

- ```MetalLB```: Is a Load Balancer that manages external access to its services. It is the only entrance to the cluster.

- ```Nginx```: Is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server.

- ```vsFTPd```: [very secure FTP daemon] Is an FTP server for Unix-like system, including Linux.

- ```MariaDB```: Is a database management system derived from MySQL with a GPL (General Public License).

- ```Wordpress```: Is a CMS(Content Managament System) focused on the creation of any type of web page.

- ```phpMyAdmin```: Is a free software tool intended to handle the administration of MySQL over the web.

- ```InfluxDB```: Is a open-source time series database developed by InfluxData

- ```Telegraf```: Is the open-source server agent to help you collect metrics from your stacks, sensors and systems.

- ```Grafana```: Is a open-source graphing and analisys software. Allows you to query, view, alert, and explore your metrics from Time Series Database Storage(TSDB)

### Technologies

- ```Docker```: Is a open-source project that automates the deployment of applications within software containers.

- ```Kubernetes```: Is an open-source system for automating the deployment, scaling, and handling of containerized applications.

- ```Minikube```: Is a tool that lets you run kubernetes locally. minikube runs a single-node kubernetes cluster on your personal computer.

- ```VirtualBox```: Is virtualization software for x86/amd64 architectures.

- ```Alpine Linux```: Is a Linux distribution based on musl and BusyBox, which aims to be lightweigth and secure by default.

### Technical considerations

- This demonstration is done on a Linux distribution ```Ubuntu 20.04.1 LTS```.

- Set up a multi-service cluster that includes Nginx, Wordpress, PhpMyAdmin, MySQL, Grafana, InfluxDB and FTPS. Each service runs in a dedicated container.

- Dockerfile of each service needs to be custom built.

- Nginx on Port 80(http) is a systematic redirect of type 301 to port 443(https).

- Wordpress have includes multiple users and an administrator.

- In the event of a crash or if one of the two database containers is stopped, we ensure that the latter persist and are not lost. In case of deletion, the volumes where the data is stored persist.

- In the event of a crash or stoppage of a container component, the containers restart automatically.

### Ports

- ```Nginx``` on Port 80(http), 443(https), and 22(ssh)
- ```FTP``` on port 21, and 30021(passive mode)
- ```Wordpress``` on port 5050
- ```PhpMyAdmin``` on port 5000
- ```MySQL``` on port 3306
- ```Grafana``` on port 3000
- ```Influxdb``` on port 8086
---

[Back To The Top](#ft_services)

## How To Use

### Installation

> Step 1: Update System and Install Required Packages

```shell
# Before installing any software, you need to update and upgrade the system you are working on.
sudo apt-get update -y
sudo apt-get upgrade -y
# Also, make sure to install (or check whether you already have) the following required packages:
sudo apt-get install curl
sudo apt-get install apt-transport-https
sudo apt-get install ca-certificates
sudo apt-get install software-properties-common
```

> Step 2: Install Docker

```shell
# First add the GPG key for the official Docker repository to your system.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add the Docker repository to APT sources.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# Next, update the package database with the Docker packages from the newly added repo.
sudo apt update
# Make sure you are about to install from the Docker repo instead of the default Ubuntu repo.
apt-cache policy docker-cesudo
# Finally, install Docker.
sudo apt-get install docker-ce
# Docker should now be installed, the daemon started, and the process enabled to start on boot.
# Check that it’s running.
sudo systemctl status docker
# To avoid typing sudo whenever you run the docker command, add your username to the docker group:
sudo usermod -aG docker $(whoami);
# To apply the new group membership, log out of the server and back in, or type the following.
su - ${USER}
# You will be prompted to enter your user’s password to continue.
# Confirm that your user is now added to the docker group by typing.
id -nG
# Using docker consists of passing it a chain of options and commands followed by arguments.
docker [option] [command] [arguments]
# To view all available subcommands, type:
docker
```

> Step 3: Install VirtualBox Hypervisor and FileZilla
```shell
# You need a virtual machine in which you can set up your single node cluster with Minikube.
# You can use VirtualBox.
# Confirm the installation with "y" and hit "Enter".
# Next, the licence agreement appears on the screen.nPress "Tab" and then "Enter" to continue.
# The installer asks you to agree with the terms of the VirtualBox PUEL license by selecting "Yes".
# Note: For the VirtualBox hypervisor to work, hardware virtualization must be enabled in your system BIOS.
sudo apt install virtualbox virtualbox-ext-pack
# FileZilla is the open source FTP client program.
# It allows us to securely transfer files from the local computer to the remote computer.
sudo apt-get install filezilla
```

> Step 4: Install Minikube
```shell
# With VirtualBox set up, move on to installing Minikube on your Ubuntu system.
# First, download the latest Minikube binary using the wget command.
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# Copy the downloaded file and store it into the /usr/local/bin/minikube directory.
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
# Next, give the file executive permission using the chmod command.
sudo chmod 755 /usr/local/bin/minikube
# Finally, verify you have successfully installed Minikube by checking the version of the software.
minikube version
```

> Step 5: Install Kubectl
```shell
# To deploy and manage clusters, you need to install kubectl, the official command line tool for Kubernetes.
# Download kubectl.
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# Make the binary executable.
chmod +x ./kubectl
# Then, move the binary into your path.
sudo mv ./kubectl /usr/local/bin/kubectl
# Verify the installation by checking the version of your kubectl instance.
kubectl version -o json
```

> Step 6: Start Minikube
```shell
# Note: Your VM has to have at least 2 CPU cores avalaible.
# It doesn't by default, so go into Virtualbox settings and add another core to it.
# Once you have set up all the required software, you are ready to start Minikube.
minikube start --vm-driver=virtualbox
# First, the system downloads the Minikube ISO file from an online source and the localkube binary.
# Then, creates a VM in VirtualBox within which it starts and configures a single node cluster.
```

> Common Minikube Commands
```shell
# To see the kubectl configuration.
kubectl config view
# To show the cluster information.
kubectl cluster-info
# To check running nodes.
kubectl get nodes
# To see a list of all the Minikube pods run.
kubectl get pods
# To enter ssh pods
kubectl exec -it <pod_name> -- /bin/sh
# To ssh into the Minikube VM. To exit out of the shell run "exit"
minikube ssh
# To stop running the single node cluster.
minikube stop
# To see the minikube ip
minikube ip
# To check its status.
minikube status
# To delete the single node cluster.
minikube delete
# To see a list of installed Minikube add-ons.
minikube addons list
# To enable and access the Minikube dashboard via terminal.
# Once you exit the terminal, the process will end and the Minikube dashboard will shut down.
minikube dashboard
```
### Usage

> Deployment

```shell
git clone https://github.com/parismart/ft_services
cd ft_services && sh setup.sh
```

[Back To The Top](#ft_services)

---

## References

- Curso de Kubernetes - [Iñigo Serrano](https://www.youtube.com/playlist?list=PLrb1e2Mp6N_uJSNsV-7SqLFaBdImJsI5x)
- Docker & k8s resources - [notion](https://www.notion.so/Docker-k8s-resources-5d89599a520b479e8f18487aa3e537a3)
- Dockerfile reference - [Docker Documentation](https://docs.docker.com/engine/reference/builder/)
- Welcome! | minikube - [minikube documentation](https://minikube.sigs.k8s.io/docs/)
- Index of /alpine/ - [Alpine Linux](https://dl-cdn.alpinelinux.org/alpine/)
- MetalLB Configuration - [MetalLB](https://metallb.universe.tf/configuration/)
- Installing MariaDB - [MariaDB](https://mariadb.com/kb/en/getting-installing-and-upgrading-mariadb/)
- PHP Manual - [Command line usage](https://www.php.net/manual/en/features.commandline.options.php)
- Manpage of vsFTPd.conf - [vsFTPd.conf](http://vsftpd.beasts.org/vsftpd_conf.html)
- InfluxData Documentation - [InfluxData](https://docs.influxdata.com/)
- Grafana Documentation - [Grafana Labs](https://grafana.com/docs/grafana/latest/)
- Schema ft_services - [AdrianWR](https://github.com/AdrianWR/ft_services/blob/master/srcs/ft_services.png)
- Schema kubernetes - [GuillaumeOz](https://github.com/GuillaumeOz/42_Ft_services/blob/master/assets/schema_ft_services.jpg)
- YAML Object Reference - [GuillaumeOz](https://github.com/GuillaumeOz/42_Ft_services/blob/master/doc/yaml_files.md)

[Back To The Top](#ft_services)

---

## License

MIT License

Copyright [2020] [Paris Martínez Ruiz]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[Back To The Top](#ft_services)

---

## Author Info

- Twitter - [@TroyaParisde](https://twitter.com/TroyaParisde)
- Instagram - [@parisdetroya42](https://instagram.com/parisdetroya42)
- 42 Madrid - [parmarti](https://profile.intra.42.fr/users/parmarti)

[Back To The Top](#ft_services)
