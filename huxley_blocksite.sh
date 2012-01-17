#!/bin/bash
# 2010.02.08

if [ $# -lt 1 ];
    then
    echo "Usage: `basename $0` sitetoblock.com"
fi

if [ $# -ge 1 ]; then
    for url in $*;
    do
	echo "0.0.0.0        " $url www.$url #http://$url http://www.$url
    done
fi
