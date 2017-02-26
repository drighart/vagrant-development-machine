#!/bin/sh

echo "Installing Wildfly..."

# We need root to install
[ $(id -u) != "0" ] && exec sudo "$0" "$@"

ed=C

WILDFLY_VERSION=10.1.0.Final
JBOSS_HOME=/opt/jboss/wildfly

if [ -d "$JBOSS_HOME" ];
then
	echo "Wildfly version $WILDFLY_VERSION already installed."
	exit 0
fi

cd ~
mkdir -p /opt/jboss/wildfly 
curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz
tar xf wildfly-$WILDFLY_VERSION.tar.gz
mv ~/wildfly-$WILDFLY_VERSION/* $JBOSS_HOME
rm wildfly-$WILDFLY_VERSION.tar.gz

echo "Done." 