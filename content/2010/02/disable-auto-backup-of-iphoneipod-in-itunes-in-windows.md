Title: Disable auto-backup of iPhone/iPod in itunes on windows
Date: 2010-02-09 20:16
Author: srini
Category: software
Tags: iphone, ipod, itunes, windows
Slug: disable-auto-backup-of-iphoneipod-in-itunes-in-windows

If you have a lot of applications in your iphone, you know how long it
can take to sync your iphone with itunes. It needs to first backup the
iphone and then sync. It is more aggravating when you just want to put
sync that one album or podcast for your train ride to work! It turns
out, you can easily disable that feature. Of course its not an option
you can disable or enable in itunes. I wish that were the case. People
have written programs to do that. All it does is update the
%appdata%\Apple Computer\iTunes\iTunesPrefs.xml file with the
instructions on not to backup. If you want to enable it again, you have
to remove those instructions. One third party app which does that is
call [Backoff](http://www.digidna.net/products/backoff). It can toggle
this setting on and off.

Just in case you want to do this yourself, here are details on how to do
it -

1.  Locate iTunesPrefs.xml by going to Start->Run and typing
    **%appdata%\Apple Computer\iTunes** and hit OK.
2.  Backup iTunesPrefs.xml
3.  Open iTunesPrefs.xml and search for **<key>User
    Preferences</key>**
4.  Under the next **<dict>** add the following:
5.  Save your changes and restart iTunes.  Auto-backup is now disabled.

