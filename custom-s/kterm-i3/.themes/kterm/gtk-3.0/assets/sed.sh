#!/bin/sh
sed -i \
         -e 's/#1a1c1e/rgb(0%,0%,0%)/g' \
         -e 's/#cccccc/rgb(100%,100%,100%)/g' \
    -e 's/#1a1c1e/rgb(50%,0%,0%)/g' \
     -e 's/#cccccc/rgb(0%,50%,0%)/g' \
     -e 's/#1a1c1e/rgb(50%,0%,50%)/g' \
     -e 's/#cccccc/rgb(0%,0%,50%)/g' \
	"$@"
