#!/bin/bash

# The full hostname to lookup
full_hostname="kafka-kafka-0.kafka-kafka-brokers.dev.svc.cluster.local"

# The hostname to use in /etc/hosts
short_hostname="kafka-kafka-0.kafka-kafka-brokers.dev.svc"

# Function to update /etc/hosts
update_hosts() {
    local hostname=$1
    local ip=$2
    
    # Remove existing entry if it exists
    sudo sed -i "/$hostname/d" /etc/hosts
    
    # Add new entry
    echo "$ip $hostname" | sudo tee -a /etc/hosts > /dev/null
}

# Check for sudo and ask for it if not running as root
if [ "$EUID" -ne 0 ]; then 
    echo "This script needs sudo privileges to modify /etc/hosts."
    exec sudo "$0" "$@"
fi

echo "Looking up $full_hostname..."

# Perform nslookup and extract IP
ip=$(nslookup $full_hostname | awk '/^Address: / { print $2 }' | tail -n1)

if [ -n "$ip" ]; then
    echo "Found IP for $full_hostname: $ip"
    update_hosts $short_hostname $ip
    echo "Hosts file updated. Here is the relevant entry:"
    grep "$short_hostname" /etc/hosts
else
    echo "Failed to resolve $full_hostname"
fi

echo "Script completed."
