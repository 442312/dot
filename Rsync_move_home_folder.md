### How to move all contetnt from home folder to another place preserving ownership permissions and dates
Made om Debian 10

```
rsync -avxHAX --progress --numeric-ids /old/destination/. /new/destination/.
```
Dots at the end of the path means that we need to sync dotfiles too.
