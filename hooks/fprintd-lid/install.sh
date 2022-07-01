#! /bin/bash

echo "Installing ACPID hook"
sudo mkdir -p /etc/acpi
sudo cp ./laptop-lid.sh /etc/acpi
sudo chmod +x /etc/acpi/laptop-lid.sh

sudo mkdir -p /etc/acpi/events
sudo cp ./laptop-lid /etc/acpi/events
sudo systemctl restart acpid.service

echo "Installing Systemd hook"
sudo mkdir -p /etc/systemd/system/
sudo cp ./laptop-lid.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now laptop-lid.service
