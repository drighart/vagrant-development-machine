#!/bin/sh

echo "Installing Libsodium..."

# We need root to install
[ $(id -u) != "0" ] && exec sudo "$0" "$@"

LIBSODIUM_VERSION=1.0.11

if [ -f "/usr/local/lib/libsodium.so" ];
then
	echo "Libsodium version $LIBSODIUM_VERSION already installed."
	exit 0
fi


# Install some tools: gcc build tools, unzip, etc
apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install curl build-essential unzip

# Download and install libsodium
# https://download.libsodium.org/doc/

# Download & extract & make libsodium
# Move libsodium build
mkdir -p /tmpbuild/libsodium
cd /tmpbuild/libsodium
curl -L https://download.libsodium.org/libsodium/releases/libsodium-$LIBSODIUM_VERSION.tar.gz -o libsodium-$LIBSODIUM_VERSION.tar.gz
tar xfvz libsodium-$LIBSODIUM_VERSION.tar.gz
cd /tmpbuild/libsodium/libsodium-$LIBSODIUM_VERSION/
./configure
make && make check
make install
mv src/libsodium /usr/local/
rm -Rf /tmpbuild/
	
echo "Done." 