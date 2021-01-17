### Download, compile and launch dwm from git source
Made on Debian 10

##### First install dependecies
```
sudo apt install xorg git build-essential suckless-tools libxft-dev libxinerama-dev libx11-dev
```

##### Next clone dwm and st (default dwm terminal emulator) sources
```
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st
```
##### Cd to dwm directory and compile dwm
```
cd dwm
make && sudo make install
```

##### Cd to st directory and compile st
```
cd st
make && sudo make install
```

##### Make dwm start with startx
Open .xsession file in your home directory and paste `exec dwm` at the **last(!)** line. If .xsession file doesn't exist, create it. It should begins with `#!/bin/sh`.  
On debian we shouldn't use .xinitrc because in debian xsession style xinirc sources /etc/X11/Xsession which launches default x-window-manager. More details in this article https://goral.net.pl/post/xsession/
