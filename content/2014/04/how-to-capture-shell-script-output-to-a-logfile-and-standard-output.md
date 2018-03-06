Title: How to capture shell script output to a logfile and standard output
Date: 2014-04-28 15:44
Author: srini
Category: software
Tags: linux, unix
Slug: how-to-capture-shell-script-output-to-a-logfile-and-standard-output

I wanted the ability to review the output from a shell script. I could
always re-direct output to a log file, but then I don't see where in the
script I am currently at. I can always open a second terminal and then
tail the lot file I used in the first place.

Well there is another way.. in short..

    ::::bash  
    $ command 2>&1 | tee -a logfile  

This works on a bash shell. I tried to get this to work on csh or tcsh..
but get an error.
