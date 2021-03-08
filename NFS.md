### How to install NFS server, configure nfs shar and mount it on remote host.
Made on Debian 10

#### First instal pacckage for nfs server
```
sudo apt install nfs-kernel-server
```

#### Next edit exports file to share a directory
```
sudo nano /etc/exports
----------------------

/nfs/share/path  NFS.CLIENT.IP(rw,sync)
```
You can specify multiple clinents ip's with different options (like NFS.CLIENT1.IP(ro,sync) NFS.CLIENT@.IP(rw,sync) ) or use expression like 192.168.1.0/24 to share to all clients in current subnet.


#### Next restart nfs service
```
sudo systemctl restart nfs-kernel-server
```

#### On cient side first install nfs-client package
```
sudo apt install nfs-common
```

#### Last, mount nfs share to your local filesystem
```
sudo mount -t nfs NFS.SERVER.IP:/nfs/share/path /mount/point
```
mount point should be already created

#### To unmount type
```
sudo umount /mount/point
```
