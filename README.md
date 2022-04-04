# samsung-galaxy-a51-gsi-boot
Script to enable fastbootd on recovery image of Samsung devices launched with Android 10 and above.

A fork from https://github.com/phhusson/samsung-galaxy-a51-gsi-boot

## Requirements
`lz4 tar openssl python3`

You can install these packages by executing this command (the script will ask for `sudo` permission):
```bash
./setup.sh
```
## Usage

After cloning this repo, place your `recovery.img` or `recovery.img.lz4` extracted from your stock Samsung firmware in the created directory and execute this command:
```bash
./run.sh
```
After patching, you will receive a file called `fastbootd-recovery.tar`, which can be flashed via AP section of Odin.
