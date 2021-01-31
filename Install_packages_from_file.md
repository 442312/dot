### How to replicate your packages on another machine.
Made on Debian 10.  

#### First create packages list in a file
```
sudo dpkg-query -f '${binary:Package}\n' -W > installed_packages.txt
```
You can whatch this list, delete unneeded packages and type names of neeeded.  


#### Next install them on another machine or reinstalled system
```
sudo xargs -a installed_packages.txt apt install
```
