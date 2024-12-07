# independent_raspPi

Every time you go to a new place and need to connect your Raspberry Pi to a new network, you need to use the Ethernet cable to connect it to your laptop first and then you connect the Pi to the nearest SSID.
This project helps get independent of the Ethernet cable.

1. Install Raspberry Pi OS into your SD card: <br />
   *Add detailed installation steps with initial customization options*
   
2. Clone this repository into the Raspberry Pi: <br />
   *Give reference link here with any additional info if necessary*

3. Necessary installations: <br />
   a) _$ sudo apt install python3-pip_ <br />
   b) Installs the development libraries for glib-2.0, which are required by "bluepy" during the installation process. <br />
      _$ sudo apt install libglib2.0-dev_ <br />
   b) Create a virtual environment to install _bluepy_: <br />
      _$ python3 -m venv bluetooth_py_ <br />
   c) Activate the virtual environment <br />
      _source bluetooth_py/bin/activate_
   d) _$ pip install bluepy_ <br />
      _$ sudo apt-get install bluetooth libbluetooth-dev_ <br />
      _$ python3 -m pip install --upgrade pip setuptools wheel_ <br />
      _$ wget https://github.com/pybluez/pybluez/archive/refs/heads/master.zip_ <br />
      _$ unzip master.zip_ <br />
      _$ cd pybluez-master_ <br />
      _$ python3 setup.py install_ <br />
      _$ python3 -m pip install --upgrade pybluez_ <br />
   
5. Configuring the wifi_connect.sh script: <br />
   a) Open the "wifi_connect.sh" script in an editor and set value of _dir_path_ variable to the path where you have stored the 
      "independent_raspPi" directory. <br />
   b) Go to the directory "independent_raspPi" and run the following terminal command: <br />
     *$ chmod 755 wifi_connect.sh* <br />

6. Set a cronjob to run this script whenever you turn the Raspberry Pi on: <br />
   a) Run the command: _$sudo crontab -e_ <br />
   b) Add the following line in the last line of the crontab: <br />
      _@reboot IRPPATH="</path/to/independent_raspPi>" && $IRPPATH/wifi_connect.sh >> $IRPPATH/wifi_connect.log 2>&1_ <br />
      <u>NOTE: modify the path in <> as per your requirement</u> <br />
   c) Save the crontab and close it. <br />

   In case the script does not trigger, you can check the wifi_connect.log for debugging. <br />
  
   
# Delete this part later:

To clone the repo:<br />
$ git clone https://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@github.com/ninadrathod/independent_raspPi.git

Go to the cloned repo:<br />
$ cd independent_raspPi/

Make your edits

To stage the all modified files: <br />
$ git add . 

To stage specific modified files:<br />
$ git add file1 file2 ..

To commit the change:<br />
$ git commit -m "commit message"

To push the code to the main branch:<br />
$ git push origin main

To pull the latest code from repo:<br />
$ git pull origin main

To see which network SSID you are connected to:<br />
$ iwgetid wlan0

To see a list of devices connected to the same network as yours:<br />
$ sudo netdiscover -r 192.168.1.254/24

Bluetooth-related commands: <br />

$ sudo systemctl enable bluetooth<br />
$ sudo systemctl start bluetooth<br />
$ hciconfig<br />
$ sudo hciconfig hci0 piscan<br />


