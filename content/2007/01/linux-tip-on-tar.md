Title: linux tip on tar
Date: 2007-01-30 11:50
Author: srini
Category: software
Tags: linux, tar, tips
Slug: linux-tip-on-tar

If you untar a package, and it makes a mess of your directory because
the packager didn't include the files in his tarball in a directory, you
can use  

    ::::bash
    $ rm `tar ftz package.tar.gz`

to quickly get rid of those cluttering files.

    ::::bash
    $ rm `tar ft package.tar`

does the same thing.

