#!/usr/bin/env sh
run()
{
	python main.py $1
}

usage()
{
	echo 'usage: run.sh 0|1|2|3'
	echo '0:first run'
	echo '1:daily update'
	echo '2:weekly update'
	echo '3:quarter update'
}

case $1 in
	0|1|2|3) run $1;;
	*)  usage;;
esac
