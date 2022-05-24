# how to share files between host machine and vm
in case host machine is `windows` and vm is `linux` follow through:
- create a directory in host
  1. right click + Click **Propreties**
  2. Click share
  3. Add permissions
- now in `linux` machine make sure you install **samba** and **cifs-utils** if needed:
```sh
sudo apt install cifs-utils
sudo mkdir -p /mnt/share
sudo mount.cifs //hostmachineIp/dirname /mnt/share/ -o user=share,pass=share
```
>you can follow either [1](https://markontech.com/linux/mount-a-network-shared-drive-on-linux/) or [2](https://ubuntuforums.org/showthread.php?t=288534)
>>If you don't know windows creds go to control pannel and check accounts, or if you are using email as default windows user then use your email credentials to mount the shared directory