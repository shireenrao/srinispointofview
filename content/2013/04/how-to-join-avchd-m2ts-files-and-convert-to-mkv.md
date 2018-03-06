Title: How to Join AVCHD M2TS files and convert to MKV
Date: 2013-04-05 15:30
Author: srini
Category: software
Tags: m2ts, mkv
Slug: how-to-join-avchd-m2ts-files-and-convert-to-mkv

There is still no cheap(free) and easy way to work with the M2TS files
created by my Canon H100 video camera. When I am shooting with that
camera, for any event, I end up with a bunch of .m2ts video files. VLC
now plays this format, but still I have to either create a playlist of
all my files or play them one at a time.

This is where the freeware
[tsMuxer](http://www.videohelp.com/tools/tsMuxeR) comes to the rescue.
SmartLabs doesn't offer this app anymore, but you can download this from
[videohelp.com](http://www.videohelp.com/tools/tsMuxeR). You can
download the app for windows, linux and Mac. If you are running OSX, use
the [VoxMac Unofficial
Build](http://www.videohelp.com/download/tsMuxeR_1.10.6_VoxMac_Unofficial_Build.dmg).
Even this build does not work correctly because of some korean fonts (I
would love to know why). Here is a snippet from [macrumors
forums](http://forums.macrumors.com/showthread.php?t=766885) on how to
fix that problem.

> tsMuxeR is not working due to fonts interpretations problem.  
>  We got a 'bus error' when trying to execute the command in
> command-line mode.  
>  The problem is due to 2 particulars korean fonts supplied in Snow
> Leopard.  
>  To solve the problem, if you don't use those korean fonts, delete  
>  the two following fonts
> : **AppleMyungjo.ttf** and **Gungseouche.ttf** located
> in **/Library/Fonts**  
>  When done, the tsMuxeR command Line should Work

Instead of deleting the fonts, I just renamed them using the command
line. tsMuxerGUI now launches with out any problems.

**Joining .M2TS file**  
I use tsMuxer to combine all the .M2TS files into one .M2TS file. It's
very easy and very quick to join these videos. These steps should work
on Windows and Linux too. Here are the step -

1\. Launch the app  


[![Screen Shot 2013-04-05 at 2.36.03
PM]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.36.03-PM.png)]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.36.03-PM.png)  


2. Drag and Drop the first file in the sequence in the Input files
window. The Add button doesnt work for M2TS files.  


[![Screen Shot 2013-04-05 at 2.39.01
PM]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.39.01-PM.png)]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.39.01-PM.png)  


3. Now Select the rest of the files you want to join together, drag and
drop on the Join button at the top.  


[![Screen Shot 2013-04-05 at 2.41.46
PM]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.41.46-PM.png)]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.41.46-PM.png)  


4. Make sure the Output is set to M2TS muxing and click on the Browse
button to choose an appropriate place to save the output. Now click
Start Muxing to join all the .M2TS files.  


[![Screen Shot 2013-04-05 at 2.47.33
PM]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.47.33-PM.png)]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.47.33-PM.png)  


You will get a status window showing progress. Click Ok when it
finishes to get back to tsMuxerGui  


[![Screen Shot 2013-04-05 at 2.48.51
PM]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.48.51-PM.png)]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-2.48.51-PM.png)


You should now have your joined .M2TS file.

But I still can't play This .M2TS on XBMC. The solution is to convert
this to an MKV file :)  
The trick is to demux this joined .M2TS file using tsMuxer and then use
[mkvmerge](http://www.bunkus.org/videotools/mkvtoolnix/) to create an
MKV file. Problem Solved! You can download mkvmerge from the
[MKVToolNix](http://www.bunkus.org/videotools/mkvtoolnix/) site. They
have binaries for windows, multiple linux platforms and Mac.

**Demuxing .M2TS file**  

1. Drop your joined .M2TS file in the input files section of the
tsMuxerGUI  


[![Screen Shot 2013-04-05 at 3.02.16
PM]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-3.02.16-PM.png)]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-3.02.16-PM.png)  


2. Select Demux in the output section at the bottom and click on Start
Demuxing. You will see the progress window again.  

3. The Demux process creates two files, a .264 (video) file and a .ac3
(audio) file.  

4. Click on the add button on the input files section of mkvmerge and
add your .264 and .ac3 files.  


[![Screen Shot 2013-04-05 at 3.17.26
PM]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-3.17.26-PM.png)]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-3.17.26-PM.png)  


5. Click on Start muxing at the bottom to create your MKV file. A
progress window comes up during the muxing process.  


[![Screen Shot 2013-04-05 at 3.19.11
PM]({filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-3.19.11-PM.png)](i{filename}/wp-content/uploads/2013/04/Screen-Shot-2013-04-05-at-3.19.11-PM.png)


You now have an MKV file which works on XBMC. As tsMuxer and mkvmerge
are tools also available on linux and windows, this process should work
on all platforms.
