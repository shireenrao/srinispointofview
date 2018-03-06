Title: Argument list too long
Date: 2011-03-29 20:02
Author: srini
Category: software
Tags: tips, unix
Slug: argument-list-too-long

Ever tried to copy or move a bunch of files on unix/linux from one
location to another and see this error message spit out back at you??  

    ::::bash  
    $ cp /var/www/* /var/tmp  
    -bash: /bin/cp: Argument list too long  

UNIX find to the rescue...  

    ::::bash  
    $ find /var/www -type f -name '*' -exec cp {} /var/tmp/. \;

problem solved!
