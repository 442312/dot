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
