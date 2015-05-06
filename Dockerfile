FROM dacr/jenkins-common
MAINTAINER David Crosson <crosson.david@gmail.com>

ENV SWARM_CLIENT_BASEURL http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client
ENV SWARM_CLIENT_URL     $SWARM_CLIENT_BASEURL/1.24/swarm-client-1.24-jar-with-dependencies.jar
ENV SWARM_CLIENT_JAR     $JENKINS_HOME/swarm-client.jar

ADD $SWARM_CLIENT_URL $SWARM_CLIENT_JAR
ADD swarm-client.sh $JENKINS_HOME/

RUN chown -R jenkins:jenkins "$JENKINS_HOME"
USER jenkins

CMD $JENKINS_HOME/swarm-client.sh

