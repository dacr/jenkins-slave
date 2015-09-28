#!/bin/bash

if [ -z "$SLAVE_NAME" ] ; then
  SLAVE_NAME="default"
fi

if [ -z "$MASTER_URL" ] ; then
  MASTER_URL=${MASTER_PORT/tcp/http}
fi

if [ -n "$JENKINS_USERNAME" ] ; then
  JENKINS_AUTH_OPTS="-username $JENKINS_USERNAME"
fi

if [ -n "$JENKINS_PASSWORD" ] ; then
  JENKINS_AUTH_OPTS=$JENKINS_AUTH_OPTS" -passwordEnvVariable JENKINS_PASSWORD"
fi

if [ -z "$LABELS" ]; then
  LABELS="slave"
fi

if [ -n "$MASTER_URL" ] ; then 
  java -jar $SWARM_CLIENT_JAR -fsroot $JENKINS_HOME -name "$SLAVE_NAME" -labels "$LABELS" -master $MASTER_URL $JENKINS_AUTH_OPTS "$@"
else
  java -jar $SWARM_CLIENT_JAR -fsroot $JENKINS_HOME -name "$SLAVE_NAME" -labels "$LABELS" $JENKINS_AUTH_OPTS "$@"
fi


