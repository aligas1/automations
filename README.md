### automations
bash script Hadoop environment automation

### -------------------------------------------------------------------------------------------------------------------------------

before running any scripts run command 
```
sudo apt-get update
```
all scripts are intended to run as 
```
sudo bash run_script.sh
```
so that password must only be entered once in the beginning for all sudo commands

-------------------------------------------------------------------------------------------------------------------------------

## Install Ubuntu Server

source: https://ubuntu.com/download/server
  
### a) On Personal Machine

command line: wget https://ubuntu.com/download/server/thank-you?version=18.04.3&architecture=amd64

### b) Create New Machine on VirtualBox
- Type: Linux  
- Ubuntu (64-bit)
- Memory: 4096 MB
- Create a virtual hard disk
- VDI
- Dynamically Allocated
- 10 GB
  
### c) Open VM
- Select start-up disk: location of Ubuntu Server on PM 
- Install Ubuntu
- Minimal Installation 
- Download UPdates
- Install 3rd party softwar
