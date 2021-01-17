### Command line options to launch and manange virtual machines with qemu

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
`-smp 2`to use 2 CPU cores  
`-cpu host`to emulate the host processor  
`-enable-kvm`to use kvm hypervisor  
`-m 2048`to set vm RAM to 2048 Mb  
`-drive format=qcow2,file=/path/to/image.qcow2` to use previously created disk image file  
