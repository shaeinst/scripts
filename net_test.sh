#!/bin/bash

SERVER="archlinux.org"

# Check if the laptop is connected to the internet
if ping -q -c 1 -W 1 $SERVER >/dev/null 2>/dev/null; then
    echo -e "Laptop is connected to the internet\n"

    # Check if the internet is working
    if curl -s $SERVER > /dev/null; then
        echo -e "Internet is working\n"
        ping $SERVER
    else
        echo "Internet is not working"
    fi
else
    echo "Laptop is not connected to the internet"
fi
