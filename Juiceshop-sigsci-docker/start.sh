#!/bin/sh

# Setting docker hostname to something useful for the WPP Dashboard
DOCKERID=`hostname`
INSTHOST="$SIGSCI_HOSTNAME-$DOCKERID"
export SIGSCI_SERVER_HOSTNAME=$INSTHOST
apk update

# Using sed to alter the exisitng server.js file to support sigsci module: 
if grep -q sigsci build/server.js
then
    echo "server.js has already been updated with SigSci entries."
else
    sed -i "s/const path = require('path')/const path = require('path')\nconst Sigsci \= require(\'sigsci-module-nodejs\')\nconst sigsci \= new Sigsci({path: \'\/var\/run\/sigsci.sock\'})/" build/server.js;
    sed -i "s/\/\* Bludgeon solution for possible CORS problems: Allow everything! \*\//app.use(sigsci.express())/" build/server.js;
fi
# curl https://cirt.net/nikto/nikto-2.1.5.tar.gz | tar xvz && 
# chmod +x nikto-2.1.5/nikto.pl && chmod +x juice-shop-scenario-runner.py 

# Starting the sigsci-agent
/usr/sbin/sigsci-agent &
trap "killall background" SIGINT
# Starting juice-shop
npm start 