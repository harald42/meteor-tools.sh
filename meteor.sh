#!/bin/bash
set -o errexit

# IP or URL of the server you want to deploy to
APP_HOST=192.168.3.28

# Uncomment this if your host is an EC2 instance
# EC2_PEM_FILE=path/to/your/file.pem

# You usually don't need to change anything below this line

APP_NAME=kitchen
ROOT_URL=http://$APP_HOST
PORT=80
APP_DIR=/var/www/$APP_NAME
MONGO_URL=mongodb://localhost:27017/$APP_NAME
if [ -z "$EC2_PEM_FILE" ]; then
    SSH_HOST="root@$APP_HOST" SSH_OPT=""
  else
    SSH_HOST="root@$APP_HOST" SSH_OPT="-i $EC2_PEM_FILE"
fi
if [ -d ".meteor/meteorite" ]; then
    METEOR_CMD=mrt
  else
    METEOR_CMD=meteor
fi

case "$1" in
deploy )
echo Deploying...
$METEOR_CMD bundle bundle.tgz > /dev/null 2>&1 &&
scp $SSH_OPT bundle.tgz $SSH_HOST:/tmp/ > /dev/null 2>&1 &&
rm bundle.tgz > /dev/null 2>&1 &&
ssh $SSH_OPT $SSH_HOST PORT=$PORT MONGO_URL=$MONGO_URL ROOT_URL=$ROOT_URL APP_DIR=$APP_DIR 'sudo -E bash -s' > /dev/null 2>&1 <<'ENDSSH'
if [ ! -d "$APP_DIR" ]; then
mkdir -p $APP_DIR
chown -R www-data:www-data $APP_DIR
fi
pushd $APP_DIR
forever stop bundle/main.js
rm -rf bundle
tar xfz /tmp/bundle.tgz -C $APP_DIR
rm /tmp/bundle.tgz
pushd bundle/programs/server/node_modules
popd
chown -R www-data:www-data bundle
cd $APP_DIR/bundle/programs/server/
npm install
cd $APP_DIR
forever start bundle/main.js
popd
ENDSSH
echo Your app is deployed and serving on: $ROOT_URL
;;
* )
cat <<'ENDCAT'
./meteor.sh [action]

Available actions:

  deploy  - Deploy the app to the server
ENDCAT
;;
esac
