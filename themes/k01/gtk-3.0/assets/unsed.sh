#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#c3c7cb/g' \
         -e 's/rgb(100%,100%,100%)/#000000/g' \
    -e 's/rgb(50%,0%,0%)/#c3c7cb/g' \
     -e 's/rgb(0%,50%,0%)/#000000/g' \
 -e 's/rgb(0%,50.196078%,0%)/#000000/g' \
     -e 's/rgb(50%,0%,50%)/#c3c7cb/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#c3c7cb/g' \
     -e 's/rgb(0%,0%,50%)/#000000/g' \
	"$@"