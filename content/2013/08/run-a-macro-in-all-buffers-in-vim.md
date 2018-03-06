Title: Run a macro in all buffers in vim
Date: 2013-08-12 17:50
Author: srini
Category: software
Tags: vim
Slug: run-a-macro-in-all-buffers-in-vim

I knew vim was powerful, but realized recently that with combined
command line tools it is really really powerful!!

Our Oracle production database was having issues at work. As a way to
find out the cause, our group was asked to switch our jboss instance to
point to a different node on the rack server. The switch, in theory is
quick and painless. One who has permissions can directly go change the
jboss oracle datasources, but in this day and age with all this change
control crap, it's really gotten tough doing such things. All changes at
my workplace need to be done by a deployment group.

As the guy who maintains the jboss instances was out, it was upto me to
to make this change. All the datasource config files for all
environments are stored in one place. It would have been painful to open
all the prod ds files and check which ones were pointing to the oracle
server. Thats where the grep command came in handy. I can just grep the
name of the server (say RACK1) and get a list of files.


    ::::bash  
    $ grep -l "RACK1" *  
    


(The reason I used the -l flag is so I just get the list of files and
not get the file contents where the line matched)

You can combine the above command with vim to open all the files in vim


    ::::bash  
    $ vim $(grep -l "RACK1" *)  
    


All the files are now open in different buffers. Now I could just use a
macro to make my change on the first file and then replay the macro on
all the buffers to make my change on all files at once :)

In command mode on the first buffer -


    ::::vim  
    qa/RACK1^McwRACK2^[q  


Breakdown -  
qa - Start recording macro  
/RACK1^M - Search file for reference for RACK1  
cw - Change word to new server name  
^[ - back to command mode  
q - stop recording

Now to apply this macro on all buffers (all files), run this in command
mode -


    ::::vim  
    :bufdo execute "normal @a" | write  


The above command is from
[here](http://vim.wikia.com/wiki/Run_a_command_in_multiple_buffers)  
Please note that I have not included how to checkout the files here.

All these changes were done within a minute but took me 2 hours to have
the changes applied in PROD. That is a different story :)
