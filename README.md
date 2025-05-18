# Raspberry Pi Setup
Collection of bash scripts for Raspberry Pi OS which are intended to simplify access to commonly used features and utilities on your Raspberry Pi devices

To install run this in your bash terminal
```
wget -O - https://raw.githubusercontent.com/chiragpai/raspberrypi-setup/refs/heads/main/setup.sh | bash
```

# Currently available scripts

## For system configuration view & edit
### disable-wifi-power-management.sh
Disables the WiFi power management in your Raspberry Pi device. Useful when your running it as a server connected to your WiFi network, prevents disconnecting from the network due to built-in power saving options.
NOTE: `sudo` is used within the script

Usage:
```
disable-wifi-power-management.sh
```

### Systemctl scripts
Start, stop, restart and check services on your Raspberry Pi OS

Usage
```
# Start a service
service-start.sh <service-name>

# Stop a service
service-stop.sh <service-name>

# Restart a service
service-restart.sh <service-name>

# Check status of a service
service-status.sh <service-name>
```

## Directory and Disk
### dir-size.sh
Prints the size of folder contents in ascending order in human readable sizes (K =  Kilobytes, M = Megabytes, G = Gigabytes)

Usage:
```
dir-size.sh <path-to-folder>
```

### ll (long list)
Equivalent to `ls -l -a` <br/>
Add additional arguements to which are supported by `ls` command

Usage:
```
# Equivalent to ls -l -a
ll

# Equivalent to ls -l -a -h
ll -h
```

### ram-swap-usage.sh
Prints the used% of RAM and SWAP in JSON format

Usage:
```
ram-swap-usage.sh
```