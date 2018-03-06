Title: Use history expansion
Date: 2008-06-20 06:04
Author: srini
Category: software
Tags: linux, tips, unix
Slug: use-history-expansion

This post is from Unix tips from IBM. What happens if you're using the
same file name for a series of commands? Well, there's a shortcut that
can quickly retrieve the last file name you used.  

What happens if you're using the same file name for a series of
commands? Well, there's a shortcut that can quickly retrieve the last
file name you used. As shown below, the !$ command returns the file
name that the previous command used. The file
this-is-a-long-lunch-menu-file.txt is searched for occurrences of the
word pickles. After searching, the vi command is used to edit the
this-is-a-long-lunch-menu-file.txt file without the need for retyping
the file name. You use the bang, or exclamation point (!), to access the
history, and the dollar sign ($) returns the last field of the previous
command. It's a great tool if you are using long file names repeatedly.

    ::::bash
    $ grep pickles this-is-a-long-lunch-menu-file.txt  
    pastrami on rye with pickles and onions  
    $ vi !$



