tree command prints content of the given directory in tree-view

tree without options lists all files and folders in current directory recursively

option -a (all) shows all (including hidden) files and folders

option -f (full) shows full paths for all files and folders relative to working directory

option -d (directories) shows only directories

option -L (Level) specifies maximum depth

For example

```
tree -df -L 3
```
will print only subdirectories of the working directory with full paths in depth of 3
