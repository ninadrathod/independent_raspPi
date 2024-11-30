#!/bin/bash

# To debug the script
# set -x

b=0

# scan for all the available WiFi networks
iwlist wlan0 scan | grep ESSID

# while loop to read "ssid" and "password" from the "ssid_password.csv" file
while IFS="," read -r ssid password
do
	# try to connect to the ssid using password
	nmcli dev wifi connect "$ssid" password "$password"
	if [ $? -ne 0 ]; then
		# Display this message if the connection fails
		echo "Connection failed for ssid: $ssid"
		continue
	else
		# if the connection is successful, set b=1 and break the loop
		b=1
		break
	fi
done < ssid_password.csv # feed ssid_password.csv as an input to the loop

# if b!=0, wifi is connected successfully
if [ $b -ne 0 ]; then
	echo "Successfully connected to WiFi network";
	echo "$(date +"%Y-%m-%d %H:%M:%S") : successfully connected to WiFi network $ssid" >> wifi_log.txt;
else
	echo "Unable to connect to any network";
	echo "$(date +"%Y-%m-%d %H:%M:%S") : unable to connect to any network" >> wifi_log.txt;
fi

# Use the following command to check which SSID is your device connected to:
# "iwgetid wlan0"
