# independent_raspPi

Every time you go to a new place and need to connect your Raspberry Pi to a new network, you need to use the Ethernet cable to connect it to your laptop first and then you connect the Pi to the nearest SSID.
This project helps get independent of the Ethernet cable.

1. Install Raspberry Pi OS into your SD card:
   *Add detailed installation steps with initial customization options*
   
3. Clone this repository into the Raspberry Pi:
   *Give reference link here with any additional info if necessary*
   
4. List of setup commands:
   Go to the directory "independent_raspPi" and run the following terminal command:
   *$chmod 755 wifi_connect.sh*
   
# Delete this part later:

To clone the repo:
$ git clone https://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@github.com/ninadrathod/independent_raspPi.git

Go to the cloned repo:
$ cd independent_raspPi/

Make your edits

To stage the all modified files:
$ git add . 

To stage specific modified files:
$ git add file1 file2 ..

To commit the change:
$ git commit -m "commit message"

To push the code to the main branch:
$ git push origin main

To pull the latest code from repo:
$ git pull origin main

To see which network SSID you are connected to:
$ iwgetid wlan0
