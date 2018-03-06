Title: FTP multiple files without prompt
Date: 2009-05-05 05:21
Author: srini
Category: software
Tags: ftp, tips
Slug: ftp-multiple-files-without-prompt

I knew there was a way to ftp multiple files without being prompted.  
It was just a matter of knowing the syntax.

It is possible to download several files at once, using the mget
command. This command can take several filenames as arguments, and you
can even use wildcards to download matching files. For example, the
command

    ::::bash
    mget *.txt

would download all the files that end in .txt in the current directory
on the remote host. When using mget , you will be prompted as to whether
or not you wish to download each file. This feature can be toggled on
and off by typing prompt at the ftp> prompt before beginning the file
transfer.  
