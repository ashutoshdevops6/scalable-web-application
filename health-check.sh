#!/bin/bash

# health-check.sh - Simple health check for the system

# Check if the system is running
if systemctl is-active --quiet apache2; then
    echo "Apache is running."
else
    echo "Apache is not running!" | mail -s "Health Check Alert" user@example.com
fi

# Check for disk space
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
if [ $DISK_USAGE -gt 90 ]; then
    echo "Disk usage is above 90%!" | mail -s "Health Check Alert" user@example.com
fi
