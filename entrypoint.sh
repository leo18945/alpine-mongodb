#!/usr/bin/dumb-init /bin/sh

echo "Starting MongoDB, please wait - live logging in 5 secs ..."

mongod \
  --port ${SERVICE_PORT} \
  --dbpath ${SERVICE_HOME} \
  --logpath ${SERVICE_LOGFILE} \
  --logappend \
  -${SERVICE_LOGLEVEL} &

sleep 5

if [ $# -gt 0 ]; then
    exec "$@"
else
    tail -f ${SERVICE_LOGFILE}
fi
