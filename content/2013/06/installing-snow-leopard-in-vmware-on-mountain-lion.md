Title: Installing Snow Leopard in VMWare on Mountain Lion
Date: 2013-06-24 13:29
Author: srini
Category: software
Tags: mac, macosx, vmware
Slug: installing-snow-leopard-in-vmware-on-mountain-lion

I am learning how to build GUI applications in Python using PyQt/PySide.
I still have ways to go before I can start building some real
applications. My end goal is to be able to learn how to build a mac
application and then package it as a disk image (.dmg) like how most mac
software is available. I would also like to learn how to create those
installer packages (.pkg/.mpkg) eventually.

One of the PySide apps I learnt was a currency converter. I thought, it
would be nice if I could create a dmg file as a proof of concept to the
entire build process. After facing a lot issues to build this on my
Mountain Lion, I finally succeeded. I will be documenting all the issues
I faced during this process in my blog.

Once I was able to do a build which worked on my own laptop, I sent the
dmg file to my brother to test out. He is still running Lion on his
macbook pro, so I thought it would be a good test for the build. The app
crashed on launch :(

After trying a couple of things we still could not get this to work.
That's when I decided to run an older version of MAC OSX as a VM on
VMWare. That way I can look at console logs and see what failures are
coming up and figure out a fix myself. As I have Snow Leopard media, I
thought it would be easy to do. Unfortunately NOT!!

Finally got my Snow Leopard VM working after reading
[this](http://forums.macrumors.com/showthread.php?t=1365439) thread on
MacRumors. I am capturing all that info here just to keep a copy. All
credit goes to the original source. I will document my Pyside Build
ordeal in a separate blog post.

<!--more Click here for details on how to Install Snow Leopard in VMWare on Mountain Lion -->

**Step One - Preparing the Snow Leopard Installation DVD**

1\. Insert a fresh Snow Leopard Installation DVD into your drive and
launch Disk Utility (/Applications/Utilities/). Since the release of
Mountain Lion, [you can obtain this DVD for $19.99 from the Apple
Store](http://store.apple.com/us/product/MC573/mac-os-x-106-snow-leopard)
or call their telesales agents [1-800-MY-APPLE (1-800-692-7753)] or
Customer Service and Sales Support at 1-800-676-2775 or 1-800-275-2273
(ask for a Sales Representative). Do not use a grey, machine-specific
Install DVD: see the attached photos.

2\. Select the device for your optical drive (note that this is NOT the
Mac OS X Installation disk, but rather the device that has mounted it;
in this example the device is named "SuperDrive”). BE VERY CAREFUL HERE!

[![Disk
Utility]({filename}/wp-content/uploads/2013/06/Disk-Utility.jpg)]({filename}/wp-content/uploads/2013/06/Disk-Utility.jpg)

3\. From Disk Utility’s File menu, choose “New > Disk Image from
[device]” from the File menu, set the image format to “DVD/CD master”
and Encryption to none and create the disk image on your Desktop. When
the creation of the disk image file is complete, quit Disk Utility and
eject the Snow Leopard Install DVD from your drive.

4\. Launch Terminal (/Applications/Utilities/); cut and paste or
carefully type the following 4 commands into Terminal and, after each,
hit Return/Enter:

5\. Change to the directory where the image is located.  

    ::::bash  
    % cd Desktop  

6\. Mount the disk image in a way that allows any changes to be kept in a
‘shadow’ file.  

    ::::bash  
    % hdiutil attach SuperDrive.cdr -shadow  

7\. Add the important file to the mounted image with this (including the
quotation marks):  

    ::::bash  
    % touch '/Volumes/Mac OS X Install DVD/System/Library/CoreServices/ServerVersion.plist'  

8\. Unmount the disk image by ‘ejecting’ the ‘Mac OS X Install DVD’ in
Finder. At this point you have two files - SuperDrive.cdr and
SuperDrive.cdr.shadow on the Desktop.

9\. Create a new DVD/CD master disk image ’SuperDrive-Server.cdr’ which
is the same as SuperDrive.cdr, but with the change included.  

    ::::bash  
    % hdiutil convert -format UDTO -o SuperDrive-Server.cdr
    SuperDrive.cdr -shadow  


10\. Quit Terminal, and continue using SuperDrive-Server.cdr in place of
SuperDrive.cdr. If you wish you can now delete SuperDrive.cdr and
SuperDrive.cdr.shadow - they are no longer needed.

(steps 4-10 are from
[here](http://forums.macrumors.com/showpost.php?p=16745691&postcount=413))

**Step Two - Installing Snow Leopard into VMWare on Mountain Lion**

1\. Launch VMWare

2\. From the File menu go to New… Then click on the "Choose Continue
without disc" button

3\. Drag and Drop the SuperDrive-Server.cdr image you created onto "Use
operating system installation disc or image" radio button and click
Continue.

4\. Change Operating System to "Apple Mac OS X" and Version to "Mac OS X
Server 10.6 64-bit" and click continue.

5\. You can click on Customize Settings to make changes to the default. I
took defaults and clicked on Finish.

6\. OS X Snow Leopard will now start to be installed into the VMWare file
called "Mac OS X Server 10.6 64-bit" located in "~Documents/Virtual
Machines". As with all Snow Leopard installations, the following
selections need to be made, as they come up:

a\. Use English for the main language (click on the right arrow).

b\. Install Mac OS X (click on Continue).

c\. Agree to the terms of the software licensing agreement by clicking
Agree.

d\. Select the disk where you want to install Snow Leopard by clicking on
the Macintosh HD, but DO NOT YET CLICK ON INSTALL.

7\. In the Utilities Menu to the right of the Mac OS X Installer Menu (at
the top of the Snow Leopard installation screen), Launch Terminal;

[![Terminal]({filename}/wp-content/uploads/2013/06/Terminal.png)]({filename}/wp-content/uploads/2013/06/Terminal.png)

8\. Type the following command (including the quotation marks) in
Terminal and then click RETURN/ENTER:  

    ::::bash  
    % mkdir -p '/Volumes/Macintosh HD/System/Library/CoreServices/'  

9\. Now type this command (including quotation marks) in Terminal and hit
RETURN/ENTER:  

    ::::bash  
    % touch '/Volumes/Macintosh HD/System/Library/CoreServices/ServerVersion.plist'  

10\. Quit Terminal and go back to the installation of Snow Leopard; BUT
FIRST: Click Customize and select Rosetta and optionally Quicktime 7 and
all printer drivers. Click on OK.

11\. Click on Install and the process will take upwards to 30 minutes or
more as Snow Leopard is installed into your VM.

12\. As it initiates Snow Leopard be sure to remember the Account Name
and Password you establish.

13\. Upon completion the installation process will reboot and you will
now have a Snow Leopard VMWare Window. Cancel ANY attempt by Software
Update at this time. I recommend the following optional settings in the
Snow Leopard environment:

a\. Go to Preferences in the Finder menu and make sure that Hard Disks
and Connected Servers are selected.

b\. Launch System Preferences and go to Date/Time and then Clock and
select show seconds.

14\. Shut down Snow Leopard. Make a snapshot of your install for backup.

**Step Three - Updating the Snow Leopard VMWare environment**

1\. Installing VMWare Tools - Start your Snow Leopard VMWare session. Go
to Virtual Machine menu option and click on Install VMWare Tools.

2\. Preparation for updating Snow Leopard

a\. a. Open TextEdit in Snow Leopard. NOTE: The first time you open
TextEdit in the Snow Leopard VMWare environment, go to the TextEdit
Menu, down to Preferences and under Format, instead of the default Rich
Text, click Plain Text; then close the Preferences window.

b\. b. Copy the following xml code into a blank open document in TextEdit
(NOTE: if you open Safari in Snow Leopard and type in the following
URL -- http://forums.macrumors.com/showthread.php?p=14799174 -- you can
then easily copy and paste the following xml text into TextEdit):


    ::::xml  
    <?xml version="1.0" encoding="UTF-8"?>  
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"  
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">  
    <plist version="1.0">  
    <dict>  
    <key>Label</key>  
    <string>com.rectalogic.vmware</string>  
    <key>ProgramArguments</key>  
    <array>  
    <string>/bin/bash</string>  
    <string>-c</string>  
    <string>/bin/rm -f /System/Library/CoreServices/ServerVersion.plist;
    trap "/usr/bin/touch /System/Library/CoreServices/ServerVersion.plist;
    exit" SIGINT SIGTERM SIGHUP; sleep 999999 &amp; wait $!</string>  
    </array>  
    <key>KeepAlive</key>  
    <true/>  
    <key>RunAtLoad</key>  
    <true/>  
    </dict>  
    </plist>  
    


NOTE: the 12th line in the middle of the text above to be entered into
Text Edit, runs off the screen here on MacRumors. BE SURE to get the
complete line; either copy and paste the whole text or be sure you are
properly entering this COMPLETE line:

<string>/bin/rm -f /System/Library/CoreServices/ServerVersion.plist;
trap "/usr/bin/touch /System/Library/CoreServices/ServerVersion.plist;
exit" SIGINT SIGTERM SIGHUP; sleep 999999 & wait $!</string>

c\. Go to Save As in the File Menu of TextEdit.

\(1) Enter the file name: "com.rectalogic.vmware.plist" (without the
quotation marks) in the Save As box (delete: ".txt"). You will see the
correct default - Plain Text Encoding: Unicode (UTF-8)

[If you do NOT see "the correct default - Plain Text Encoding: Unicode
(UTF-8)" when you try to Save As, it is probably because, when you
pasted in the code, it pasted as Rich Text. You can fix this easily by
going to Format > Make Plain Text, after which the UTF-8 option (and
.txt option) will be available.];

\(2) Uncheck the box "If no extension is provided, use '.txt'." and save
it to the Desktop. If it asks which extension, choose .plist.

\(3) Quit TextEdit.

\(4) Go to the Desktop and move the file to /Macintosh
HD/Library/LaunchDaemons/ and when it asks - click Authenticate and then
enter your Snow Leopards account password.

d\. Open Terminal in Snow Leopard from /Macintosh
HD/Applications/Utilities/. Enter the following text in Terminal and
then hit RETURN/ENTER:


    ::::bash  
    % sudo chown root:wheel /Library/LaunchDaemons/com.rectalogic.vmware.plist  


e\. It will ask you for your Snow Leopard account password; enter it
(nothing will appear on screen as you type the password) and hit
RETURN/ENTER.

f\. Enter the following text in Terminal and then hit RETURN/ENTER:  

    ::::bash  
    % sudo launchctl load /Library/LaunchDaemons/com.rectalogic.vmware.plist  


g\. Quit Terminal

3\. Updating Snow Leopard and other software updates  
a\. In the Apple Menu in Snow Leopard go to Software Updates...

b\. After it Checks for New Software, it will tell you updates are
available:

\(1) Click the Show Details button.

\(2) My advice is that at this time (May, 2012) all updates should be
accepted except for the Apple Software Installation Update 1.0 (which
has had some problems and probably only fixes installation problems of
software that you would preferably be installing into Lion anyway).

\(3) You will most likely have to restart after the Software Installation
and there may be additional software updates that will appear after a
restart.

\(4) Repeat this process until all recommended updates are complete.

c\. In System Preferences, go to Sharing and turn on File Sharing. NOTE:
you may have to turn on printer sharing in your Lion environment to
access your printers in Snow Leopard.

4\. Congratulations: you now have a completely functional Snow Leopard
environment in VMWare

**Step Four - Backup your Snow Leopard VMWare Files**  
1. Shut Down Snow Leopard.

2\. Make a backup of the VMWare file "~Documents/Virtual Machines/Mac OS
X Server 10.6 64-bit".

END OF INSTALLATION INSTRUCTIONS
