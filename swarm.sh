#!/bin/bash

SSHKEY=$HOME/.ssh/id_rsa

if [ -z "$SLAVE_NAME" ] ; then
  SLAVE_NAME="default"
fi

if [ -z "$MASTER_URL" ] ; then
  MASTER_URL=${MASTER_PORT/tcp/http}
fi

if [ ! -f $SSHKEY ] ; then
  echo "generating ssh key"
  ssh-keygen -q -t rsa -f $SSHKEY -N ''
fi


if [ -n "$MASTER_URL" ] ; then 
  java -jar $SWARM_CLIENT_JAR -fsroot $JENKINS_HOME -name "$SLAVE_NAME" -master $MASTER_URL $*
else
  java -jar $SWARM_CLIENT_JAR -fsroot $JENKINS_HOME -name "$SLAVE_NAME" $*
fi


