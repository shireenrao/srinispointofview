Title: replay a vim macro until end of buffer
Date: 2013-08-12 16:06
Author: srini
Category: software
Tags: vim
Slug: replay-a-vim-macro-until-end-of-buffer

This is an awesome trick I learnt recently. It's a great trick if you
don't know how many times you need to run your macro. In short it is
called a recursive macro :)

The gist is, you first make sure the register you are going to record
your macro in is empty. Now while recording your macro call the register
you are recording in as the last command.

For example if you are recording your macro in register a -

In command mode, first make sure your register is empty -  

    ::::vim  
    qaq  

or  

    ::::vim  
    :let @a=""  


You can confirm your register is empty by printing the contents of
register a by using -  

    ::::vim  
    "ap  


Now suppose I am working on a python script and need to comment out the
script from current line to end of buffer, I would run this in command
mode -


    ::::vim  
    qaI#^[j@aq  


Here is the breakdown  
qa - start recording in register a  
I# - Insert # in the beginning of current line  
^[ - Thats what gets types when you hit escape to come out of insert mode  
j - go down to next line  
@a - nothing happens as register a is empty  
q - quit recording

When you execute @a again as register a now is set it calls itself and
repeats till end of buffer. A very cool trick indeed!!

Another way using the visual mode is by using the following command


    ::::vim  
    VG:normal @a  


The problem with the visual mode is that it only works when your macro
is only editing on a single line. If you macro spans across lines, the
visual mode trick will not work. I have to confess, I still need to
fully understand how to use normal in vim commands.
