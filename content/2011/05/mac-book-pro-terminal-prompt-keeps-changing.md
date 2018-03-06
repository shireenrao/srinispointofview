Title: Mac Book Pro terminal prompt keeps changing
Date: 2011-05-03 11:00
Author: srini
Category: software
Tags: mac
Slug: mac-book-pro-terminal-prompt-keeps-changing

It got really annoying for me to see how my terminal prompt kept
changing when I connected my Macbook from work. I know I can easily fix
this by setting my prompt in my .profile file, but I wanted to find out
why this was happening.

It turns out the culprit is DHCP. By Default the hostname is determined
dynamically on your macbook. This setting can be controlled with your
/etc/hostconfig file. Here is what it looks like on my laptop -  

    ::::bash  
    \# This file is going away

    AFPSERVER=-NO-  
    AUTHSERVER=-NO-  
    TIMESYNC=-NO-  
    QTSSERVER=-NO-  


To hard code a hostname, I just added "HOSTNAME=MyMacBook" (without the
quotes) to the end of the file.  
Some might consider the changing hostname a feature they might want.
Not me ;)
