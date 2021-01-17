### How to install and configure virt-manager
Made on Debian 10

##### Install libvirt and essencial dependencies
```
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
```

###### To run virt-manager without root privilegues add our user to apropriate groups
```
sudo adduser k01 libvirt libvirt-qemu
```
Restart system to apply changes
