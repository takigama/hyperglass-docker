#!/bin/bash


if [ ! -f /root/hyperglass/hyperglass.yaml ]
then
	echo " ---- No hyperglass.yaml, assuming no setup"
	echo " ---- uncompressing template, none exist"
	tar xfz /templ/template.tgz -C /
fi


echo " --- Starting Redis"

/usr/bin/redis-server /etc/redis/redis.conf

if [ $? -eq 0 ]
then
	echo " --- redis started successfully"
else
	echo " **** REDIS SERVER STARTUP FAILURE - continue anyway"
fi


/usr/local/bin/hyperglass start

if [ $? -eq 0 ]
then
	echo " --- hyperglass started successfully"
else
	echo " **** hyperglass failed to start"
fi
