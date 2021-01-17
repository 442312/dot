### How to install and configure virt-manager
Made on Debian 10


##### All commands list. Explanation is below
```
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
sudo adduser our_user libvirt libvirt-qemu
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
