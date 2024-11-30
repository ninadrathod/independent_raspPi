#!/bin/bash


b=0
iwlist wlan0 scan
while IFS="," read -r ssid password
do
	nmcli dev wifi connect "$ssid" password "$password"
	if [ $? -ne 0 ]; then
		echo "Connection failed for ssid: $ssid"
		continue
	else
		b=1
		break
	fi
done < ssid_password.csv
if [ $b -ne 0 ]; then
	echo "Successfully connected to WiFi network"
	echo "$(date +"%Y-%m-%d %H:%M:%S") : successfully connected to WiFi network $ssid" >> $HOME/wifi_log.txt
else
	echo "Unable to connect to any network"
	echo "$(date +"%Y-%m-%d %H:%M:%S") : unable to connect to any network" >> $HOME/wifi_log.txt
fi
