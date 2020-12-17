#!/bin/sh

if [ ! -z $SIGSCI_RPC_ADDRESS ]; then
	export SIGSCI_RPC_ADDRESS=$HOSTNAME:`echo $SIGSCI_RPC_ADDRESS | awk -F':' '{print $2}'`
fi

/sigsci/bin/sigsci-agent

