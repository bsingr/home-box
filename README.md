# home-box

Configuration for setting up a home server / wifi router / NAS.

## Requirements

The remote server must match the following conditions:

* Hostname `home`
* Sudo-User `dpree`
* SSH daemon running (`dpree@home.local`, port `22`)
* Hardware
  * network interfaces
    * wlan0 LAN
    * eth0 LAN
    * eth1 WAN
  * hard drives
  	* /dev/sda
    * /dev/sdb
    * /dev/sdc

## License

Copyright (c) 2013 Jens Bissinger. See [LICENSE.txt](LICENSE.txt).
