### Screen tearing quick fix in Debian 10/ Crunchbang++ (intel graphics)
Tested on Debian sid main

Create file 20-intel.conf in your /etc/X11/xorg.conf.d/

```
sudo geany /etc/X11/xorg.conf.d/20-intel.conf
```

with the following content

```
Section "Device"
	  Identifier "Intel Graphics"
	  Driver "intel"
	  Option "TearFree" "true"	
  EndSection
```
