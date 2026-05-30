#!/bin/sh
set -x
id
pwd
find /app
export PATH="$PATH:/app/jdk/bin"
export APP_JDBC_URL=jdbc:h2:./code/databases/task-db
/app/dist/bin/run.sh
