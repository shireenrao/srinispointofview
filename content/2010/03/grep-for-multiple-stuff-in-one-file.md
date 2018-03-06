Title: Grep for multiple stuff in one file
Date: 2010-03-19 08:00
Author: srini
Category: software
Tags: tips
Slug: grep-for-multiple-stuff-in-one-file

Update: See the comments to see how to do this correctly.

the UNIX grep command is very powerful, but the egrep command is even
more powerful. You can grep for multiple strings in a file using the
egrep command. All you have to do is use the | (or) symbol and add as
many strings you want to look for. You have to make sure you escape the
pipe symbol. This is especially helpful when you are wading through log
files.


    ::::bash  
    egrep "string 1"\|"string 2" file.log  

The above command will only display the lines from file.log that have a
reference of "string 1" and "string 2"
