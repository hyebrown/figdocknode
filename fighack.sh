#!/bin/bash

echo "==================================================================="
echo "cleaning up any old containers"
echo "==================================================================="

echo ; echo ; echo
sleep 1

# clean up any pre-existing docker containers
echo "WARNING: about to delete any containers docker knows about"
echo "WARNING: about to execute:"

echo

echo "          sudo docker rm -f <all containers docker knows about>"

echo; echo

echo "           sleeping for 10 seconds "

echo

echo "           hit <ctrl>-C if you're having second thoughts"

echo ; echo ; echo ; echo ; echo ; echo ; echo ; echo ; echo ; echo ; echo ; echo

sleep 10

sudo docker ps -a | awk '{ print $1 }' | grep -v CONTAINER | while read i; do sudo docker rm -f $i; done

echo "==================================================================="
echo "building containers"
echo "==================================================================="

# build out the 2 containers 
sudo fig build

echo "==================================================================="
echo "            starting docker2"
echo "==================================================================="
# start up docker2 which is linked to docker1
sudo fig run docker2
