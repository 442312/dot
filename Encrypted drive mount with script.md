### How to create and mount encrypted external drive without password with script
Made on Debian 10

#### First locate our drive
```
lsblk
```
Let's say it's main partition path is /dev/sdc1.  

#### Next let's encrypt it (ALL EXISTING DATA WILL BE LOST!!)

```
sudo cryptsetup --cipher aes-xts-plain --key-size 512 --hash sha512 -v luksFormat /dev/sdc1
```
You will be asked to create passphrase and repeat it.  


#### Now let's open it and create filesystem

```
sudo cryptsetup -v luksOpen /dev/sdc1  usbdisk
sudo mkfs -t ext4 -L usbdisk /dev/mapper/usbdisk
```
You will be asked to type our drive's passphrase after the first command.  


#### Now let's create key file to open our drive without passphrase

```
mkdir /home/user/.luks-keys
dd if=/dev/urandom of=.luks-keys/usbdisk bs=512 count=8
```
Here we created a folder for key files and a key file in it for our drive.  


#### Next we shall make our encrypted partition remember this key to open partition whithout a passphrase

```
sudo cryptsetup -v luksAddKey /dev/sdc1 home/user/.luks-keys/usbdisk
```

#### Next we have to know our encrypted partition's UUID
This will make unnessecary to locate our drive path each time we connect it.

```
sudo cryptsetup luksDump /dev/sdc1 | grep "UUID"
```
Let's say our partition's UUID=5eebea70-9a89-47a8-ad21-7da361b7df00.  

#### Now let's create a mountpoint for our encrypted partition

```
mkdir -p /home/user/.mnt/usbdisk
```

#### Now let's test how it works

First close encrypted partition
```
sudo cryptsetup -v luksClose usbdisk
```

Next open it with the existing key file
```
sudo cryptsetup -v luksOpen  UUID=5eebea70-9a89-47a8-ad21-7da361b7df00 usbdisk --key-file=/home/user/.luks-keys/usbdisk
```

And last mount it to previously created mount point
```
sudo mount /dev/mapper/usbdisk /home/user/.mnt/usbdisk
```
Now our partition is mounted under /home/user/.mnt/usbdisk without asking for a passphrase.  


#### Tune permissions

Because prtitions and filesystems were created with root permissions we should change them for our user:
```
sudo chown -R user:user /home/user/.mnt/usbdisk
```
or
```
sudo chown -R user:user /home/user/.mnt
```

#### Unmount and close partition

```
sudo umount /dev/mapper/usbdisk
sudo cryptsetup -v luksClose usbdisk
```
#### Now we shall create scripts to mount/unmount our partition with short commands

First script to mount. Create it in Your PATH
```
touch /home/user/.bin/mountusbdisk
chmod +x /home/user/.bin/mountusbdisk
vim /home/user/.bin/mountusbdisk
---------------------------------------------
#!/bin/bash
sudo cryptsetup -v luksOpen  UUID=5eebea70-9a89-47a8-ad21-7da361b7df00 usbdisk --key-file=/home/user/.luks-keys/usbdisk
sudo mount /dev/mapper/usbdisk /home/user/.mnt/usbdisk
```

Last the script to unmount
```
touch /home/user/.bin/umountusbdisk
chmod +x /home/user/.bin/umountusbdisk
vim /home/user/.bin/umountusbdisk
---------------------------------------------
#!/bin/bash
sudo umount /dev/mapper/usbdisk
sudo cryptsetup -v luksClose usbdisk
```

Now when you insert your disk and type in console:
```
mountusbdisk
```
It will open and mount our encrypted partition to /home/user/.mnt/usbdisk only asking for a root password

To unmount it just type
```
umountusbdisk
```

That's it.


