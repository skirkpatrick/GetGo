#!/usr/bin/env sh

set -e

echo "WARNING: This script is going to uninstall Go."


PATH=/usr/local   # Only change this if you know what you're doing.
DIR=go
GOROOT=$INSTALL/go
GOPATH=~/gocode

answer=""
while [ "$answer" != "Y" -a "$answer" != "N" ]; do
  echo "Do you want to continue? (Y/N)"
  read answer
  answer=`echo $answer | tr yn YN`
done

if [ "$answer" == "Y" ]; then
  if [ -f ~/.bash_profile ]; then
    PROFILE=~/.bash_profile
  else
    PROFILE=~/.profile
  fi
  echo "NOTE: Remove the lines listed bellow from $PROFILE"
  echo "export GOROOT=$GOROOT"=
  echo "export GOPATH=$GOPATH"
  echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin"

  echo "Uninstalling Go from $GOROOT"
  rm -rf $PATH/$DIR
  echo "Go was succesfully uninstalled"
else
  echo "Aborting..."
  exit 1
fi