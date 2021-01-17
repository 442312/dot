### Command line options to create and launch virtual machines with pure qemu-kvm
Made on Debian 10

##### All commands list. Explanation is below
```
sudo apt install qemu-kvm
sudo qemu-img create -f qcow2 /path/to/image.qcow2 20G
sudo qemu-img create -f qcow2 -o preallocation=falloc /path/to/image.qcow2 20G
sudo qemu-img create -f raw /path/to/image.img 10G
sudo qemu-img create -f qcow2 -b /path/to/image.qcow2 /path/to/image-snapshot.qcow2
sudo qemu-system-x86_64 -boot d -cdrom /path/to/iso.iso -smp 2 -cpu host -enable-kvm -m 2048 -drive format=qcow2,file=/path/to/image.qcow2
sudo qemu-system-x86_64 -smp 2 -cpu host -enable-kvm -m 2048 -drive format=qcow2,file=/path/to/image.qcow2
sudo qemu-system-x86_64  -net nic -net user,smb=/path/to/shared/folder -smp 2 -cpu host -enable-kvm -m 2048 -drive format=qcow2,file=/path/to/image.qcow2
sudo apt install cifs-utils
sudo mount -t cifs //10.0.2.4/qemu/ /mnt/`
sudo umount -a -t cifs -l
```

##### First install qemu
```
sudo apt install qemu-kvm
```

##### Next create disk image file for virtual machine
```
sudo qemu-img create -f qcow2 /path/to/image.qcow2 20G
```
This will create dynamicaly growing qcow2 disk image with maximum size of 20 gygabytes.
To create preallocated disk image file use options ```-o preallocation=full``` or ```-o preallocation=falloc```. Full preallocation will overwrite free space with zeros, falloc only preallocates space. Both of them gives increased perfomance for virtual machine. Full preallocation gives it little more, but takes much more time depending on image size.  
Example for falloc preallocation:
```
sudo qemu-img create -f qcow2 -o preallocation=falloc /path/to/image.qcow2 20G
```
To give virtual machine maximum performance we can use raw disk image format. Disadvantages of raw format are the inability to use incremental backup solutions, compression and encryption of the disk image. Raw images also doesn't support preallocation.  
Example command:
```
qemu-img create -f raw /path/to/image.img 10G
```

##### Next boot from iso to install guest operating system
```
sudo qemu-system-x86_64 -boot d -cdrom /path/to/iso.iso -smp 2 -cpu host -enable-kvm -m 2048 -drive format=qcow2,file=/path/to/image.qcow2
```
Options here are:  
`-boot d -cdrom /path/to/iso.iso` to boot from specifyed iso file  
`-smp 2` to use 2 CPU cores  
`-cpu host` to emulate the host processor  
`-enable-kvm` to use kvm hypervisor  
`-m 2048` to set vm RAM to 2048 Mb  
`-drive format=qcow2,file=/path/to/image.qcow2` to use previously created disk image file  

##### After installation is complete, boot the new virtual machine with command
```
sudo qemu-system-x86_64 -smp 2 -cpu host -enable-kvm -m 2048 -drive format=qcow2,file=/path/to/image.qcow2
```
This is the same command witout boot and cdrom options.

##### Create disk image snapshot
To have some experiments and leave our clean installation untouched we can create an overlay disk image based onour main disk image file. All changes will be written to a new overlay image.
```
qemu-img create -f qcow2 -b /path/to/image.qcow2 /path/to/image-snapshot.qcow2
```
Next launch virtual machine from this new snapshot file:
```
sudo qemu-system-x86_64 -smp 2 -cpu host -enable-kvm -m 2048 -drive format=qcow2,file=/path/to/image-snapshot.qcow2
```
#### Important!!!
Dont launch original base disk image! Keep it untouched! Any changes on it will make snapshot image dead!

##### Next we may wish to have acsess to some host folders
In this case launch virtual machine with the next command:
```
sudo qemu-system-x86_64  -net nic -net user,smb=/path/to/shared/folder -smp 2 -cpu host -enable-kvm -m 2048 -drive format=qcow2,file=/path/to/image.qcow2
```
Options `-net nic -net user,smb=/path/to/shared/folder` are used to share a folder with guest operating system.  
On guest we shell use the following commands to mount thr folder from host (guest is also debian).
to instal cifs mount dependensies:
```
sudo apt install cifs-utils
```
to mount the host shared folder to /mnt:
```
sudo mount -t cifs //10.0.2.4/qemu/ /mnt/
```
to unmount the shared folder:
```
sudo umount -a -t cifs -l
```


