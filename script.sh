#!/bin/bash

# Set username and password
username="temp"
password="temp"

# Create user with password
sudo useradd -m -s /bin/bash "$username" && echo "$username:$password" | sudo chpasswd

# Grant sudo access
sudo usermod -aG sudo "$username"

# Set up passwordless sudo access for the user
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee "/etc/sudoers.d/$username"

# Switch to the new user and execute additional commands
sudo -u "$username" bash << EOF
echo "User: \$USER"
EOF
