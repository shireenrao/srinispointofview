Title: A better cygwin terminal - rxvt
Date: 2010-03-22 09:00
Author: srini
Category: software
Tags: cygwin, windows
Slug: a-better-cygwin-terminal-rxvt

rxvt is so much more better than the default cygwin terminal. You will
thank me once you switch to using rxvt. To get rxvt working without
starting an X Server, just create a shortcut using the following -  

    ::::dos  
    C:\cygwin\bin\rxvt.exe -fg green -bg black -fn "Lucida Console-14" -e bash --login -i  

This is assuming that cygwin is installed at c:\\cygwin. You will get a
foreground of green on a black background. The font used is "Lucida
Console-14".
