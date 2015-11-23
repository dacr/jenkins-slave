FROM java:8-jdk
MAINTAINER David Crosson <crosson.david@gmail.com>

RUN apt-get update \
 && apt-get install -y git \
 && apt-get install -y zip unzip tar  \
 && apt-get install -y proxytunnel \
 && apt-get install -y python-pip \
 && apt-get install -y python-dev \
 && rm -rf /var/lib/apt/lists/*

ENV SWARM_CLIENT_BASEURL http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client
ENV SWARM_CLIENT_URL     $SWARM_CLIENT_BASEURL/1.26/swarm-client-1.26-jar-with-dependencies.jar
ENV SWARM_CLIENT_JAR     $JENKINS_HOME/swarm-client.jar

ADD $SWARM_CLIENT_URL $SWARM_CLIENT_JAR
ADD swarm.sh $JENKINS_HOME/

ADD start.sh /start.sh
RUN chmod a+rx /start.sh

ENTRYPOINT [ "/start.sh" ]

