Title: How to make a bootable install of Mavericks on USB Flash Drive
Date: 2014-04-15 15:12
Author: srini
Category: software
Tags: mac, macosx
Slug: how-to-make-a-bootable-install-of-mavericks-on-usb-flash-drive

Your USB drive should be called Untitled and formatted as Mac OS
Extended (Journaled). The installer should be called Install OS X
Mavericks.app and should be in your Applications folder.

Run the following command to prepare your USB to be a bootable
installer, Don't worry.. it takes 20-25 minutes to finish..

    ::::bash  
    $ sudo /Applications/Install\ OS\ X\ Mavericks.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ OS\ X\ Mavericks.app --nointeraction  
    
You should see something like this:

    ::::bash
    Erasing Disk: 0%... 10%... 20%... 100%...  
    Copying installer files to disk...  
    Copy complete.  
    Making disk bootable...  
    Copying boot files...  
    Copy complete.  
    Done.

You can then boot up from the USB by holding down the option key, then
install the Mavericks from the USB.

*[Source](http://forums.macrumors.com/showpost.php?p=18081307&postcount=3)
