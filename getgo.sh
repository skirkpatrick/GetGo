#!/usr/bin/env sh
set -e

if [ `uname -m` = 'x86_64' ]; then
    ARCH='amd64'
else
    ARCH='386'
fi

if [ `uname` = 'Linux' ]; then
    DISTRO=linux
elif [ `uname` = 'Darwin' ]; then
    DISTRO=darwin
else
    echo "This script does not support `uname` OS at this time"
    exit 1
fi

INSTALL=/usr/local   # Only change this if you know what you're doing.
GOROOT=$INSTALL/go
GOPATH=~/gocode      # This is where your workspace will be. Change it!
VERSION=1.0.3
BINARY=go$VERSION.$DISTRO-$ARCH.tar.gz
URL=https://go.googlecode.com/files/$BINARY


echo "Downloading $BINARY from $URL"
curl -O -L $URL

echo "Installing Go into $GOROOT"
sudo tar -C $INSTALL -xzf $BINARY

echo "Creating workspace at $GOPATH"
for dir in src pkg bin
do
    mkdir -p $GOPATH/${dir}
done

echo "Setting environment variables"
if [ -f ~/.bash_profile ]; then
    PROFILE=~/.bash_profile
else
    PROFILE=~/.profile
fi
echo "export GOROOT=$GOROOT" >> $PROFILE
echo "export GOPATH=$GOPATH" >> $PROFILE
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $PROFILE
export GOROOT
export GOPATH
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

echo "Cleaning up"
rm $BINARY

echo "Installation complete"
