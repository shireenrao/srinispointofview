Title: Shell script to download Vimeo Videos
Date: 2013-06-27 21:24
Author: srini
Category: software
Tags: linux, mac, script
Slug: shell-script-to-download-vimeo-videos

I know you can easily download vimeo videos, but I wanted to download
all of Derek Wyatt's excellent vim tutorials for offline viewing in one
shot. Ideally downloading all videos directly from the rss feed would be
the best option. I could not find any application which did that but
found a shell script from <http://ossguy.com/?p=841>. Unfortunately the
script no longer worked :(

I then found another script on github
[here](https://github.com/johnteslade/vimeo-downloader). Reading that
script I saw that it was based on the first script I had found and John
Teslade had fixed it up after Vimeo had made changes to their site.

I saved the script in my bin directory which is on my path. I then
tested it with a sample video and it worked beautifully. The best part
was that the saved video file was named with the title of the video.
Perfect! Well almost. This script does not dowmload videos based on a
playlist or rss feed.

That's where I come in :). I opened the Derek Wyatt's rss feed on
[vimeo](http://vimeo.com/user1690209). saved the xml file locally on my
computer. I called it vimeo.xml. Stupid thing all came in one line.
Never mind... opened the file in vim and used the following commands to
beautify it -


    ::::vim  
    :%s/></>\r</g  
    :0 
    =:$  


Now just grep the file and look for the string " <link>" and pipe it to
a file. Lets call that file playlist.txt


    ::::bash  
    % grep "<link>" vimeo.xml > playlist.txt  


The contents of the file looked like this -


    ::::xml  
    <link>http://vimeo.com/user1690209/videos</link>  
    <link>http://vimeo.com/user1690209/videos</link>  
    <link>http://vimeo.com/15443936</link>  
    <link>http://vimeo.com/7133419</link>  
    <link>http://vimeo.com/7129986</link>  
    <link>http://vimeo.com/7096383</link>  
    <link>http://vimeo.com/7035132</link>  
    <link>http://vimeo.com/6999927</link>  
    <link>http://vimeo.com/6342264</link>  
    <link>http://vimeo.com/6332848</link>  
    <link>http://vimeo.com/6329762</link>  
    <link>http://vimeo.com/6307101</link>  
    <link>http://vimeo.com/6306508</link>  
    <link>http://vimeo.com/6216655</link>  
    <link>http://vimeo.com/6185584</link>  
    <link>http://vimeo.com/6170479</link>  
    <link>http://vimeo.com/6154082</link>  
    <link>http://vimeo.com/6110008</link>  
    <link>http://vimeo.com/6093081</link>  
    <link>http://vimeo.com/6025010</link>  
    <link>http://vimeo.com/6024774</link>  
    <link>http://vimeo.com/4457161</link>  
    <link>http://vimeo.com/4456458</link>  
    <link>http://vimeo.com/4454614</link>  
    <link>http://vimeo.com/4449258</link>  
    <link>http://vimeo.com/4448635</link>  
    <link>http://vimeo.com/4448265</link>  


Clearly you can tell the first two are not video links. So just delete
those two lines. Then do a global search and replace to remove the
strings " <link>" and "</link>". The following vim recipe from
<http://rayninfo.co.uk/vimtips.html> worked for me -


    ::::vim  
    :%s#<[^>]\+>##g  


Save and close the file. Now just run the following command to download
all the videos -


    ::::bash  
    $ for line in `cat playlist.txt`; do vimeo_downloader.sh $line; done  


Maybe some day I will enhance this script to do all this for me.
