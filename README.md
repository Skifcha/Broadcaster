# Broadcaster
Simple app, which makes your iOS device act as iBeacon.

# Installation
Just launch this app on any real device, it will start to act like iBeacon with pre-defined region data. 
iBeacon settings can be changed in Constants.swift file, but I suggest to keep it as it is.

You need a developer or personal (free) Apple account to run on a real device. 
Select your account under ["General"](http://take.ms/BKe1N) tab in project settings and run the project.

If you are using free Apple account, verify the Developer App certificate for your account is trusted on your device. Open Settings on your device and navigate to General -> Device Management, then select your Developer App certificate to trust it.

It may ask you to change "Bundle Identifier". You can do it on the same page, just change it to whatever unique and run the project.

# Pros
Try to turn on / off bluetooth, app should react with simple status update on main screen.

App doesn't work in background, since Apple doesn't allow iOS device to range in background.

App prevents device from sleeping, so it can broadcast until battery goes off.

# Demo
[Demo](https://drive.google.com/open?id=1VzQyCeQq1es76EXSs8fwOMw89fb_0aG2)
