Title: Read Video files metadata in python using hachoir-metadata
Date: 2013-02-28 09:17
Author: srini
Category: software
Tags: python
Slug: read-video-files-metadata-in-python-using-hachoir-metadata

The only module out there for reading video files metadata I could find
is hachoir-metadata. Actually you can extract metadata from multimedia
files like images, audio files and video files. it also works on
different types of archives. I tested it against all kinds of files and
it does a great job in most of the popular ones.
[Their](https://bitbucket.org/haypo/hachoir/wiki/hachoir-metadata) bit
bucket site lists all the formats hachoir-metadata supports.

Unfortunately installing it on my mac using python pip does not fulfill
dependencies. I was getting the following error trying to run their
sample program..


    ::::bash  
    $ hachoir-metadata  
    Traceback (most recent call last):  
    File
    &amp;amp;amp;quot;/Users/shireenrao/.virtualenvs/default/bin/hachoir-metadata&amp;amp;amp;quot;,
    line 5, in &amp;amp;amp;lt;module&amp;amp;amp;gt;  
    from hachoir_core.error import error, HachoirError  
    ImportError: No module named hachoir_core.error  


I was surprised when doing a google search saw that nobody else had seen
this issue. After reading their website, found that the module had
dependencies. I Fixed this by installing the following dependencies...


    ::::bash  
    $ pip install hachoir-parser  
    $ pip install hachoir-core  
    

