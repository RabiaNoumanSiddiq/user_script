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
# Add your additional commands here
sudo apt update
clear
sudo apt install -y software-properties-common
clear
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
clear
sudo apt update
clear
sudo apt -y install code
clear
export PATH="/usr/shared/code/bin:$PATH"
echo $PATH
clear
EOF
