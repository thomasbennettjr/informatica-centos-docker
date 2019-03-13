#!/bin/sh

if [ ! $# -eq 2 ] ; then
    echo "No username password provided"
    echo "please provide username and password"
    exit 10
fi

set -e
echo ${PWD}
for entry in "/infa/infaagent/apps/agentcore"/*
do
  echo "$entry"
done
cd /infa/infaagent/apps/agentcore
su -c "./agent_start.sh" -s /bin/sh infa &

echo "Sleeping"
sleep 3
echo "Waking"

/infa/infaagent/apps/agentcore/consoleAgentManager.sh configureToken $1 $2 
echo "Wait"

wait
