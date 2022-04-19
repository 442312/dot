### How to install and configure virt-manager
Made on Arch linux 2022.03


##### All commands list. Explanation is below
```
sudo pacman -S virt-manager qemu libvirt edk2-ovmf dnsmasq iptables-nft
sudo systemctl enable --now libvirtd.service
sudo vim /etc/libvirt/libvirtd.conf
-Edit
...
unix_sock_group = 'libvirt'
...
unix_sock_rw_perms = '0770'
...

-Save Close

sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt-qemu $USER

sudo vim /etc/libvirt/qemu.conf
-Edit
# Some examples of valid values are:
#
#       user = "qemu"   # A user named "qemu"
#       user = "+0"     # Super user (uid=0)
#       user = "100"    # A user named "100" or a user with uid=100
#
user = "username"

# The group for QEMU processes run by the system instance. It can be
# specified in a similar way to user.
group = "username"

-Save Close

sudo systemctl restart libvirtd.service


sudo pacman -S samba
sudo vim /etc/samba/smb.conf
-Paste from https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD
-Edit
[global]
  netbios name = ck01-201


[homes]
   comment = Home Directories
   browseable = no
   read only = no
   create mask = 0750
   directory mask = 0750
   valid users = $USER

-Save Close

sudo systemctl enable --now smb.service
sudo systemctl enable --now nmb.service
sudo smbpasswd -a $USER
sudo systemctl restart smb.service

-On client
sudo apt install cifs-utils
sudo mount -t cifs -o user=HOSTUSER,uid=1000,gid=1000 //HOSTNAME.local/HOSTUSER /mnt
sudo vim /etc/fstab
```

##### Install libvirt and essencial dependencies
```
sudo pacman -S virt-manager qemu libvirt edk2-ovmf dnsmasq iptables-nft
```

##### Enable and start service
```
sudo systemctl enable --now libvirtd.service
```

##### Edit libvirt configuration file
```
sudo vim /etc/libvirt/libvirtd.conf
...
unix_sock_group = 'libvirt'
...
unix_sock_rw_perms = '0770'
...
```

##### To run virt-manager without root privilegues add our user to apropriate groups
```
sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt-qemu $USER
```

##### Edit qemu configuration file
```
sudo vim /etc/libvirt/qemu.conf
# Some examples of valid values are:
#
#       user = "qemu"   # A user named "qemu"
#       user = "+0"     # Super user (uid=0)
#       user = "100"    # A user named "100" or a user with uid=100
#
user = "username"

# The group for QEMU processes run by the system instance. It can be
# specified in a similar way to user.
group = "username"
```
##### Restart service
```
sudo systemctl restart libvirtd.service
```

### How to share host home folder to guest with rw permissions
Made on Archlinux host and Debian 10  guest

#### ON HOST

##### First install samba
```
sudo pacman -S samba
```

##### Create and edit samba confiuration file

Paste example content from [samba github page](https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD)

```
sudo vim /etc/samba/smb.conf
[global]
  netbios name = ck01-201


[homes]
   comment = Home Directories
   browseable = no
   read only = no
   create mask = 0750
   directory mask = 0750
   valid users = $USER

```

##### Enable and start services
```
sudo systemctl enable --now smb.service
sudo systemctl enable --now nmb.service
```

##### Next create your user samba password
```
sudo smbpasswd -a $USER
```
##### Restart samba
```
sudo systemctl restart smb.service
```
Now we have running samba with rw access to our home folder 

#### ON GUEST

##### Install cifs-utils
```
sudo apt install cifs-utils
```
##### Mount our host home folder to /mnt
```
sudo mount -t cifs -o user=HOSTUSER,uid=1000,gid=1000 //HOSTNAME.local/HOSTUSER /mnt
```
##### To make a permanent onboot mount add this to fstab
```
sudo vim /etc/fstab
//HOSTNAME.local/HOSTUSER    /MOUNTPOINT    cifs   credentials=/home/GUESTUSER/.smbcredentials,uid=1000,gid=1000   0 0
```
Now we have read and write access to our host home folder

### How to set needed screen resolution on virtual machine startup
Made on Debian openbox (#!++)

```
vim .config/openbox/autostart
xrandr --output Virtual-1 --mode 1920x1080
```
