#!/usr/bin/env bash
#Generate system load to test monitoring


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


header "Generating CPU and I/O load for 60 seconds..."
echo""
# Install stress tool if not present
sudo apt-get install stress -y > /dev/null 2>&1

# Run stress: 2 CPU workers, 1 I/O worker for 60 seconds
stress --cpu $(nproc) --timeout 60s
echo""

header "Load test complete. Check your Netdata dashboard for spikes!"