## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text][diagram]

[diagram]: https://github.com/sandrasantos0507/cybersecurity-bootcamp-project1/blob/main/Diagrams/Sandra%20Santos%20ElkStack.png "diagram"

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

  [ELK playbook](https://github.com/sandrasantos0507/cybersecurity-bootcamp-project1/blob/main/Ansible/elk.yml)
  <br>
  [Metricbeat playbook](https://github.com/sandrasantos0507/cybersecurity-bootcamp-project1/blob/main/Ansible/metricbeat-playbook.yml)
  <br>
  [Filebeat playbook](https://github.com/sandrasantos0507/cybersecurity-bootcamp-project1/blob/main/Ansible/filebeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
Load balancers help ensure environment availability through distribution of incoming data to web servers. Jump boxes allow for more easy administration of multiple systems and provide an additional layer between the outside and internal assets.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the event logs and system metrics.
Filebeat watches for log directories or specific log files.
Metricbeat helps monitor servers by collecting metrics from the system and services running on the server.

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web 1    | Server         |  10.0.0.5          |   Linux               |
| Web 2    | Server         |   10.0.0.6         |   Linux              |
| Web 3    | Server  |   10.0.0.8          |  Linux |
| ELK Server     | Log Server         |   10.1.0.4         |  Linux                |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Personal IP address

Machines within the network can only be accessed by the Jump Box_.
The Elk Machine can have access from the personal IP address through port 5601.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes          | Personal   |
| Load Balancer         | Yes                    |   Open                   |
|  Web 1        | No                    |   10.0.0.5                   |
|  Web 2        | No                    |   10.0.0.6                   |
|  Web 3        | No                    |    10.0.0.8                  |
|  ELK Server        |   Yes                  |   Personal                   |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because services running can be limited, system installations and updates can be streamlined and processes become more replicable.

The playbook implements the following tasks:
- installs docker.io, pip3, and the docker module.
- increases the virtual memory (for the virtual machine we will use to run the ELK server)
- uses sysctl module
- downloads and launches the docker container for elk server

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text][diagram]

[diagram]: https://github.com/sandrasantos0507/cybersecurity-bootcamp-project1/blob/main/Diagrams/dockerps.png "docker ps"

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
