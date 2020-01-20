#!/bin/bash

cat > /etc/systemd/system/reddit-app.service << EOF
[Unit]
Description=reddit-app

[Service]
Type=simple
WorkingDirectory=/home/appuser/reddit
ExecStart=/usr/local/bin/puma
Restart=always

[Install]
WantedBy=multi-user.target

EOF

systemctl daemon-reload
systemctl enable reddit-app.service
systemctl start reddit-app
