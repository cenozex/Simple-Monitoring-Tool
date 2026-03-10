#!/usr/bin/env bash
#Remove Netdata and configuration

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

header "Uninstalling Netdata"
echo""

#It uses uninstaller.sh from its installation dir and delete the tool

if [ -f /usr/libexec/netdata/netdata-uninstaller.sh ]; then
    sudo /usr/libexec/netdata/netdata-uninstaller.sh --yes --force
else
    header "Uninstaller not found. Attempting manual removal..."
    echo""
    sudo apt-get purge netdata -y
    sudo rm -rf /etc/netdata /var/lib/netdata /var/log/netdata
fi
echo""
header "Cleanup complete."