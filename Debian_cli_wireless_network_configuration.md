### How to connect wi-fi on Debian cli

#### First get your wireless interface name
```
ip a
----------------------------------------
2: wlp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 12:41:8a:5c:8d:ab brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.2/24 brd 192.168.1.255 scope global dynamic noprefixroute wlp2s0
```

#### Next edit interfaces file

```
nano /etc/network/interfaces
----------------------------------------
allow-hotplug wlp2s0
iface wlp2s0 inet dhcp
        wpa-ssid ESSID
        wpa-psk PASSWORD
```

#### Last restart networking service

```
sudo systemctl restart networking.service
```

Now we're connected to ESSID wireless network
