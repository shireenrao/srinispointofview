Title: XBMC has No Sound after upgrading to Frodo on Mountain Lion
Date: 2013-03-06 22:03
Author: srini
Category: software
Tags: xbmc
Slug: xbmc-has-no-sound-after-upgrading-to-frodo-on-mountain-lion

I wanted to test out Frodo on my laptop before I upgraded xbmc on my mac
mini which is my main home theatre PC. I am still running Version 11.0
(Eden) everywhere. Good thing I tested this on my laptop first because
the upgrade was a fail. I could not get any sound to play after the
upgrade. After poking around the settings, I found out that the Audio
Output Device was set to Airplay as shown in xbmc's Audo Output section
of the System Settings screen shot below -

[![Screen Shot 2013-03-06 at 9.43.22
PM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-06-at-9.43.22-PM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-06-at-9.43.22-PM.png)

I just changed it to "Built-in Output" and that fixed the issue. I was
also hearing only from one side of my headphones. Seeing the release
notes for this new release I saw that it was a known bug and can be
fixed by changing the Speaker Configuration from 2.1 to 2.0. Here is a
screenshot after my changes.

[![Screen Shot 2013-03-06 at 9.23.43
PM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-06-at-9.23.43-PM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-06-at-9.23.43-PM.png)


