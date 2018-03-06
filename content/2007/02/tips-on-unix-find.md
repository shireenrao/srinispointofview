Title: Tips on unix find
Date: 2007-02-13 09:27
Author: srini
Category: software
Tags: find, linux, tips, unix
Slug: tips-on-unix-find

Here is a nice tip on unix find..

    ::::bash
    $ find . cpio -pdumv /path/to/destination/dir

the files found by find are passed into cpio and it copies the files
with the same permissions to the destination directory.
