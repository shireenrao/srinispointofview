Title: More unix find tips
Date: 2007-08-08 08:26
Author: srini
Category: software
Tags: find, linux, tips, unix
Slug: more-unix-find-tips

There are so many little things to remember in this command that I
always have to lookup what switches to use. So here are a few ways of
using find

To find all files modified in the last 24 hours (last full day) in
current directory and its sub-directories:

    ::::bash
    find . -mtime -1 -print

Flag -mtime -1 option tells find command to look for files modified in
the last day (24 hours). Flag -print option will cause find command to
print the files’ location. -print can be replaced with -ls if you want a
directory-listing-type response.

To find all files modified in the last 24 hours (last full day) in a
particular specific directory and its sub-directories:

    ::::bash
    find /directory_path -mtime -1 -print

The command is basically the same with the earlier command, just that
now you no need to cd (change directory) to the directory you want to
search.

To find all files with regular file types only, and modified in the last
24 hours (last full day) in current directory and its sub-directories:

    ::::bash
    find /directory_path -type f -mtime -1 -print

To find all files that are modified today only (since start of day only,
i.e. 12 am), in current directory and its sub-directories:

    ::::bash
    touch -t `date +%m%d0000` /tmp/$$  
    find /tmefndr/oravl01 -type f -newer /tmp/$$  
    rm /tmp/$$

The first command can be modified to specify other date and time, so
that the commands will return all files that have changed since that
particular date and time.

Find a file or directory  

    ::::bash
    find . -name TEMP -print  
    # or  
    find . -name TEMP -exec echo {} \;

Find core files in this directory tree and remove them  

    ::::bash
    find . -name "core" -exec rm -f {} \;

Find junk directories and remove their contents recursively  

    ::::bash
    find . -name "junk" -exec rm -rf {} \;

Find a pattern in a file using the recursive grep (ignore case)  

    ::::bash
    find . -type f xargs grep -i MYPATTERN

Find files modified in the past 7 days  

    ::::bash
    find . -mtime -7 -type f

Find files owned by a particular user  

    ::::bash
    find . -user esofthub

Find all your writable directories and list them  

    ::::bash
    find . -perm -0777 -type d -ls  
    # or  
    find . -type d -perm 777 -print

Find all your writable files and list them  

    ::::bash
    find . -perm -0777 -type f -ls  
    # or  
    find . -type f -perm 777 -print

Find large file sizes and list them  

    ::::bash
    find . -type f -size +1000 -lsor  
    # or
    find . -type f -size +1000 -print

Find how many directories are in a path (counts current directory)  

    ::::bash
    find . -type d -exec basename {} \; wc -l  
    53

Find how many files are in a path  

    ::::bash
    find . -type f -exec basename {} \; wc -l  
    120

Find all my pipe files and change their permissions to all writable  

    ::::bash
    find . -name "pipe*" -exec chmod 666 {} \;

Find files that were modified 7 days ago and archive  

    ::::bash
    find . -type f -mtime 7 xargs tar -cvf `date '+%d%m%Y'_archive.tar`

Find files that were modified more than 7 days ago and archive  

    ::::bash
    find . -type f -mtime +7 xargs tar -cvf `date '+%d%m%Y'_archive.tar`

Find files that were modified less than 7 days ago and archive  

    ::::bash
    find . -type f -mtime -7 xargs tar -cvf `date '+%d%m%Y'_archive.tar`

Find files that were modified more than 7 days ago but less than 14 days
ago and archive  

    ::::bash
    find . -type f -mtime +7 -mtime -14 xargs tar -cvf `date '+%d%m%Y'_archive.tar`

Find files in two different directories having the "test" string and
list them  

    ::::bash
    find esofthub esoft -name "*test*" -type f -ls

Find files in two different directories having the "test" string and
list them  

    ::::bash
    find esofthub esoft -name "*test*" -type f -ls

Find files in two different directories having the "test" string and
count them  

    ::::bash
    find esofthub esoft -name "*test*" -type f -ls wc -l  
    12

Find files and directories newer than CompareFile  
    
    ::::bash
    find . -newer CompareFile -print

Find files and directories older than CompareFile  

    ::::bash
    find . ! -newer CompareFile -print

Find files and directories but don't traverse a particular directory  

    ::::bash
    find . -name RAID -prune -o -print

Find all the files in the current directory  

    ::::bash
    find * -type f -print -o -type d -prune

Find an inode and remove  

    ::::bash
    find . -inum 968746 -exec rm -i {} \;

Avoid using "-exec {}", as it will fork a child process for every file,
wasting memory and CPU in the process. Use `xargs`, which will
celeverly fit as many arguments as possible to feed to a command, and
split up the number of arguments into chunks as necessary:

    ::::bash
    find . -depth -name "blabla*" -type f xargs rm -f

Also, be as precise as possible when searching for files, as this
directly affects how long one has to wait for results to come back. Most
of the stuff actually only manipulates the parser rather than what is
actually being searched for, but even there, we can squeeze some
performance gains, for example:  

use "-depth" when looking for ordinary files and symollic links, as
"-depth" will show them before directories  

use "-depth -type f" when looking for ordinary file(s), as this
speeds up the parsing and the search significantly:

    ::::bash
    find . -depth -type f -print ...

use "-mount" as the first argument when you know that you only want to
search the current filesystem, and  

use "-local" when you want to filter out the results from remote
filesystems.  

Note that "-local" won't actually cause `find` not to search remote
file systems -- this is one of the options that affects parsing of the
results, not the actual process of locating files; for not spanning
remote filesystems, use "-mount" instead:

    ::::bash
    find / -mount -depth \( -type f -o -type l \) -print ...

