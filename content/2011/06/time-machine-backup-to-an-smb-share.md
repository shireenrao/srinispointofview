Title: Time Machine backup to an SMB share
Date: 2011-06-16 14:55
Author: srini
Category: software
Tags: mac
Slug: time-machine-backup-to-an-smb-share

If you wanted Time Machine to work with a SMB share you will notice that
it doesn't work. To get it to work run the following command on the
terminal  

    ::::bash  
    defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1  


Now mount your SMB share. The best way to do this is to click on
Go->connect to server in the finder menubar. For the server name you
enter smb://username:password@servername/ShareName. I have a NAS share
which has a Guest account with no password so my address looks like
smb://Guest:@MyServer/HomeShare/TimeMachineBackup. Notice I have no
password as no password is required for the Guest account.  
Once mounted, Control click on the Time machine in the Dock and select
"Time Machine Preferences". Once you select "Choose Backup Disk" you
should see your SMB Share. Select your SMB share and start your Time
Share.  
Once Time Machine backup starts, you will see an error saying that it
cannot create image error. This error message was expected as Time
machine could not create a file called a sparsebundle which is required
for it to work on the SMB share. For this to work correctly we will be
creating the sparsebundle manually. Turn off Time machine and go on to
the next step.

In your terminal find your mac address. You can do this with the
following command  

    ::::bash  
    ifconfig en0 | grep ether  
      

Make a note of the mac address without the colon symbol. For this
example lets assume my MAC address is 000000000000. Decide on how big
you want your Time Machine backup to be. Then run the hdiutil command to
create your sparsebundle file. Here is the command I created for a 200
Gigs share -  

    ::::bash  
    hdiutil create -size 200g -fs HFS+J -volname “OSX Backup” mymac_000000000000.sparsebundle  
      

Where 000000000000 is my mac address and mymac is my mac name.

Now copy the sparsebundle file to the Nas share you want for your
backups. In my case I copied it to the TimeMachineBackup folder on my
NAS Share.

Go back to Time machine preferences and turn on Time machine. You should
now see that the backup starts up with no problems. Depending on what
you are backing up, the first time it runs it might take some time.

An important point to note is that for this to work your NAS Share needs
to be mounted. You can set Time machine to be manual so that way you can
make sure your SMB share is mounted before you click on the backup
button.
