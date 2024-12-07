#!/bin/bash

# To debug the script
# set -x

sleep 60

b=0

# store the path to independent_raspPi directory in a variable to reuse it later in the script
dir_path="/home/pi/independent_raspPi"

# scan for all the available WiFi networks
sudo iwlist wlan0 scan | grep ESSID

# while loop to read "ssid" and "password" from the "ssid_password.csv" file
while IFS="," read -r ssid password
do
	# try to connect to the ssid using password
	sudo nmcli dev wifi connect "$ssid" password "$password"
	if [ $? -ne 0 ]; then
		# Display this message if the connection fails
		echo "Connection failed for ssid: $ssid"
		continue
	else
		# if the connection is successful, set b=1 and break the loop
		b=1
		break
	fi
done < $dir_path/ssid_password.csv # feed ssid_password.csv as an input to the loop

# if b!=0, wifi is connected successfully
if [ $b -ne 0 ]; then
	echo "Successfully connected to WiFi network";
	echo "$(date +"%Y-%m-%d %H:%M:%S") : successfully connected to WiFi network $ssid" >> $dir_path/wifi_log.txt;
else
	echo "Unable to connect to any network";
	echo "$(date +"%Y-%m-%d %H:%M:%S") : unable to connect to any network" >> $dir_path/wifi_log.txt;
fi

# Use the following command to check which SSID is your device connected to:
# "iwgetid wlan0"
