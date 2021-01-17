### Command line options to launch and manange virtual machines with qemu

First install qemu
```
sudo apt install qemu-kvm
```
Next create disk image file for virtual machine
```
sudo qemu-img create -f qcow2 /path/to/image.qcow2 20G
```
This will create dynamicaly growing qcow2 disk image with maximum size of 20 gygabytes.
To create preallocated disk image file use options ```-o preallocation=full``` or ```-o preallocation=falloc```.
