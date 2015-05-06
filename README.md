# Jenkins slave container

Usage :

* from the same host where the jenkins master is running
  - `docker run -d -e SLAVE_NAME=S1 --link myjenkins:master --name myslave-1 dacr/jenkins-slave`
* from an external host 
  - `docker run -d -e SLAVE_NAME=S1 -e MASTER_URL=http://somewhere:someport/ --name slave-1 dacr/jenkins-slave`

