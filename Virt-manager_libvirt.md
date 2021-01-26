### How to install and configure virt-manager
Made on Debian 10


##### All commands list. Explanation is below
```
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
sudo adduser our_user libvirt libvirt-qemu
sudo apt install samba
sudo systemctl status smbd.service
sudo systemctl start smbd.service
sudo systemctl enable smbd.service
sudo vim /etc/samba/smb.conf
[homes]
   comment = Home Directories
   browseable = no
   read only = no
   create mask = 0750
   directory mask = 0750
   valid users = HOSTUSER
sudo smbpsswd -a HOSTUSER
sudo systemctl restart smbd.service
sudo apt install cifs-utils
sudo mount -t cifs -o user=HOSTUSER,uid=1000,gid=1000 //HOSTNAME.local/HOSTUSER /mnt
sudo vim /etc/fstab
```

##### Install libvirt and essencial dependencies
```
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
```

##### To run virt-manager without root privilegues add our user to apropriate groups
```
sudo adduser our_user libvirt libvirt-qemu
```
Restart system to apply changes

### How to share host home folder to guest with rw permissions
Made on Debian 10 host and guest

#### ON HOST

##### First install samba
```
sudo apt install samba
```

##### Next enshure samba demon is running
```
sudo systemctl status smbd.service
```

##### Otherwise start and enable it
```
sudo systemctl start smbd.service
sudo systemctl enable smbd.service
```

##### Edit samba config to make home folder share writable for your user
```
sudo vim /etc/samba/smb.conf
[homes]
   comment = Home Directories
   browseable = no
   read only = no
   create mask = 0750
   directory mask = 0750
   valid users = HOSTUSER
```
##### Next create your user samba password
```
sudo smbpsswd -a HOSTUSER
```
##### Restart samba
```
sudo systemctl restart smbd.service
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

### How to set needed sreen resolution on virtual machine startup
Made on Debian openbox (#!++)
