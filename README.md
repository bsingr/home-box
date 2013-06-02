# home-box

Configuration for setting up a home server / wifi router / NAS.

## Requirements

The remote server must match the following conditions.

### Hardware

* network interfaces
  * wlan0 LAN
  * eth0 LAN
  * eth1 WAN
* hard drives
	* /dev/sda
  * /dev/sdb
  * /dev/sdc

### Basic OS

* Hostname `home`
* Sudo-User `dpree`
* SSH daemon running (`dpree@home.local`, port `22`)

### ZFS Pool

    $ zfs list
    NAME                USED  AVAIL  REFER  MOUNTPOINT
    store               824G  89.4G    33K  /store
    store/master        398G  89.4G   398G  /store/master
    store/timemachine   426G  89.4G   426G  /store/timemachine

## License

Copyright (c) 2013 Jens Bissinger. See [LICENSE.txt](LICENSE.txt).
