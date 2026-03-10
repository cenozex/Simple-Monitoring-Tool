#!/usr/bin/env bash

#Color Codes

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33'
BOLD='\033;1m'
RESET='\033[0m'

divider()
{
    echo -e "${CYAN}────────────────────────────────────────────────────${RESET}"
}

header()
{
    divider
    echo -e "${BOLD}${YELLOW}   $1${RESET}"
    divider
}



#Making sure system is up-to-date
#sudo apt-get update && sudo apt-get upgrade -y

header "Installing Netdata On Linux System Using Wget"
echo""
echo "1) Install Stable release with automatic updates enabled"
echo "2) Install Stable Release with automatic updates disabled"
echo "3) Install Nightly Release with automatic updates enabled"
echo "4) Install Nightly Release with automatic updates disabled"
echo""
read -p "Enter choice [1-4]: " choice
echo""

BASE_CMD=""

case $choice in
    1)
        header "Installing Stable release with automatic updates enabled"
        eval "$BASE_CMD --stable-channel --disable-telemetry"
        ;;
    2)
        header "Installing Stable Release with automatic updates disabled"
        eval "$BASE_CMD --no-updates --stable-channel --disable-telemetry"
        ;;
    3)
        header "Installing Nightly Release with automatic updates enabled"
        eval "$BASE_CMD --disable-telemetry"
        ;;
    4)
        header "Installing Nightly Release with automatic updates disabled"
        eval "$BASE_CMD --no-updates --disable-telemetry"
        ;;
    
    *)
        header "Invalid option. Exiting."
        exit 1
        ;;
esac

echo "Setup process finished. Dashboard available at http://localhost:19999"