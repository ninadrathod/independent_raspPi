# independent_raspPi

Every time you go to a new place and need to connect your Raspberry Pi to a new network, you need to use the Ethernet cable to connect it to your laptop first and then you connect the Pi to the nearest SSID.
This project helps get independent of the Ethernet cable.

1. Install Raspberry Pi OS into your SD card: <br />
   *Add detailed installation steps with initial customization options*
   
2. Clone this repository into the Raspberry Pi: <br />
   *Give reference link here with any additional info if necessary*

3. Necessary installations: <br />
   a) _$sudo apt install python3-pip_ <br />
   b) Installs the development libraries for glib-2.0, which are required by "bluepy" during the installation process.
      _$sudo apt install libglib2.0-dev_ <br />
   b) Create a virtual environment to install _bluepy_: <br />
      _$python3 -m venv bluetooth_py_
   c) Activate the virtual environment
      _source bluetooth_py/bin/activate_
   d) _$pip install bluepy_ <br />
      _python3 -m pip install pybluez_ <br />
   
5. Configuring the wifi_connect.sh script: <br />
   a) Open the "wifi_connect.sh" script in an editor and set value of _dir_path_ variable to the path where you have stored the 
      "independent_raspPi" directory. <br />
   b) Go to the directory "independent_raspPi" and run the following terminal command:
     *$chmod 755 wifi_connect.sh* <br />

6. Set a cronjob to run this script whenever you turn the Raspberry Pi on: <br />
   a) Run the command: _$sudo crontab -e_ <br />
   b) Add the following line in the last line of the crontab: <br />
      _@reboot IRPPATH="</path/to/independent_raspPi>" && $IRPPATH/wifi_connect.sh >> $IRPPATH/wifi_connect.log 2>&1_ <br />
      <u>NOTE: modify the path in <> as per your requirement</u> <br />
   c) Save the crontab and close it. <br />

   In case the script does not trigger, you can check the wifi_connect.log for debugging. <br />
  
   
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

To see a list of devices connected to the same network as yours:
$ sudo netdiscover -r 192.168.1.254/24
