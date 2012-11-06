#!/usr/bin/env sh
run()
{
	python main.py $1
}

usage()
{
	echo 'usage: run.sh 0|1|2|3 \r\n0:first run \r\n1:daily update \r\n2:weekly update \r\n3:quarter update'
}

case $1 in
	0|1|2|3) run $1;;
	*)  usage;;
esac
