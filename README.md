# cloudKi

#### -- CloudKi-iot Client software
- cloudKi-iot-rp4
  - apps
  - modules(sub-module)
    - pm2-ui(sub-module)
      - frontend
    - static-server (cloudKi-static-server-module(sub-module))
    - cloud-client (cloudKi-cloud-client-module(sub-module))
  - scripts
    - install.sh
    - setkioskurl.sh

#### -- CloudKi SaS
- cloudKi-cloud-server  ---socket-io-server
  - frontend

#### -- CloudKi-iot Modules
- CloudKi-modules
  - cloudKi-static-server-module(sub-module)
  - cloudKi-cloud-client-module(sub-module)


todo:
 - install wpa_supplicant
   -  sh -c 'wpa_passphrase SSID passphrase >> /etc/wpa_supplicant/wpa_supplicant.conf' 
 - install node and npm
 -  install pm2
 -  install git
 -  install openbox
 -  install and config nginx
 -  clone cloudKi repo
 -  git sub-modules
 -   npm install
 -   enable sudoers setkioskurl.sh without password
 -   set openbox env vars(KIOSK_URL)
 -   config pm2
   -   run init service
   -   start pm2-ui
   -   start cloudKiStatic
   -   save for restart
 -   create public dir, and symlink modules/static/public
 -   build startup script, will set wifi, kiosk url