Title: Manage directory navigation with pushd and popd
Date: 2008-06-20 06:13
Author: srini
Category: software
Tags: linux, tips, unix
Slug: manage-directory-navigation-with-pushd-and-popd

UNIX supports a wide variety of directory-navigation tools. Two good
tools are pushd and popd.  

You're certainly aware that the cd command changes your current
directory. What happens if you have several directories to navigate, but
you want to be able to quickly return to a location? The pushd and popd
commands create a virtual directory stack, with the pushd command
changing your current directory and storing it on the stack, and the
popd command removing the directory from the top of the stack and
returning you to that location. You can use the dirs command to display
the current directory stack without pushing or popping a new directory.
Listing below shows how you can use the pushd and popd commands to
quickly navigate the directory tree.

    ::::bash
    $ pushd .  
    ~ ~  
    $ pushd /etc  
    /etc ~ ~  
    $ pushd /var  
    /var /etc ~ ~  
    $ pushd /usr/local/bin  
    /usr/local/bin /var /etc ~ ~  
    $ dirs  
    /usr/local/bin /var /etc ~ ~  
    $ popd  
    /var /etc ~ ~  
    $ popd  
    /etc ~ ~  
    $ popd  
    ~ ~  
    $ popd

The pushd and popd commands also support parameters to manipulate the
directory stack. Using the +n or -n parameter, where n is a number, you
can rotate the stack left or right, as shown below

    ::::bash
    $ dirs  
    /usr/local/bin /var /etc ~ ~  
    $ pushd +1  
    /var /etc ~ ~ /usr/local/bin  
    $ pushd -1  
    ~ /usr/local/bin /var /etc ~

