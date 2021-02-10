### How to install and run VNC server and connect to it with VNC client
Made on Debian 9-10

#### First install vnc-server
```
sudo apt update
sudo apt install lightdm
sudo reboot
sudo apt install x11vnc
```
This installation requiers lightdm login manager, if you have one, skip it's installation/

#### Next create corresponding systemd service
```
sudo nano /lib/systemd/system/x11vnc.service
--------------------------------------------
[Unit]
Description=x11vnc service
After=display-manager.service network.target syslog.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -forever -display :0 -auth guess -passwd PASSWORD
ExecStop=/usr/bin/killall x11vnc
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Replace PASSWORD with the one you choose for your vnc connection

#### Next enable and start newly created service
```
sudo systemctl daemon-reload
sudo systemctl enable x11vnc.service
sudo systemctl start x11vnc.service
sudo systemctl status x11vnc.service
```

#### Get server's ip
```
ip a
```

#### Last install vnc-client on other machine
```
sudo apt install xtightvncviewer
```

To connect to remote machine launch xtightvncviewer with the method of your choice.
In the window that should appear type server's IP and PASSWORD when prompted.

