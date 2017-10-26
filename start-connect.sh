#!/usr/bin/env bash
set -ex

env=$CONNECT_ENV

cd bin/

#runs this line at background after 10 seconds.
( sleep 30; curl -s -X PUT -H "Content-Type: application/json" -d @config/connector.$env.json http://localhost:8083/connectors/MordorRabbitMQSourceConnector/config ) &

connect-distributed config/worker.$env.properties