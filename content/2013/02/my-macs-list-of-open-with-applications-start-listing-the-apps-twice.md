Title: My macs list of "Open with" applications start listing the apps twice
Date: 2013-02-27 08:17
Author: srini
Category: software
Tags: mac
Slug: my-macs-list-of-open-with-applications-start-listing-the-apps-twice

When I right click on a file on my mac, I started seeing multiple apps
being listed in the "Open with..." menu.

[![20130227-085554.jpg]({filename}/wp-content/uploads/2013/02/20130227-085554.jpg)]({filename}/wp-content/uploads/2013/02/20130227-085554.jpg)

Typically this list of apps are the apps which can open the file. Seeing
the same application listed multiple times in the "Open With..." list
doesn't harm anything but is definitely annoying!

So I googled the problem, and saw others were having the same issue.
Basically the launchServices database gets corrupted which leads to this
problem.

To fix on Mountain Lion:

1\. Open Terminal.app in the /Applications/Utilities/ folder.  
2\. run

    ::::bash
    $ /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user  

3\. Restart

If you don't like using the command line, the free tool Onyx also has an
option under Maintenance -> Rebuild -> launchservices.

Another option is to uninstall the application which is showing up
multiple time and install it back.

All the above options work.
