#!/usr/bin/env sh

if [ "`which go`" != "" ]; then
  echo "WARNING: This script is going to uninstall Go."

  answer=""
  while [ "$answer" != "Y" -a "$answer" != "N" ]; do
    echo "Do you want to continue? (Y/N)"
    read answer
    answer=`echo $answer | tr yn YN`
  done

  if [ "$answer" == "Y" ]; then
    echo "You might need to enter your password"
    echo "Uninstalling Go from $GOROOT"
    sudo rm -rf $GOROOT
    echo "Go was succesfully uninstalled"
  else
    echo "Aborting..."
    exit 1
  fi
else
  echo "Error: Go isn't installed on your machine"
fi