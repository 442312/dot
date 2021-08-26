#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#1a1c1e/g' \
         -e 's/rgb(100%,100%,100%)/#cccccc/g' \
    -e 's/rgb(50%,0%,0%)/#1a1c1e/g' \
     -e 's/rgb(0%,50%,0%)/#cccccc/g' \
 -e 's/rgb(0%,50.196078%,0%)/#cccccc/g' \
     -e 's/rgb(50%,0%,50%)/#1a1c1e/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#1a1c1e/g' \
     -e 's/rgb(0%,0%,50%)/#cccccc/g' \
	"$@"
