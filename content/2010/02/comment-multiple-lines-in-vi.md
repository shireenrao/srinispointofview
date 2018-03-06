Title: comment multiple lines in vi
Date: 2010-02-11 22:11
Author: srini
Category: software
Tags: unix, vi, vim
Slug: comment-multiple-lines-in-vi

The comment symbol for Unix scripts is typically "#". You can use the
same concept for files for other programming languages. My vi commands
below use the "#" symbol.  
  
If you want to comment 5 lines in a file -


1.  Go to the first line you want to comment
2.  Make sure you are in the command mode. (Hit ESC).
3.  Now type the following ":.,+N-1 s/^/#/g", Where N is the
    number of lines you want to comment.


In this case it would be -

    ::::vim  
    :.,+4 s/^/#/g  


You can also comment till a unique word in a file. For instance here is
a snippet of a file -  

    ::::text  
    line one  
    line two  
    line three  
    line four  
    line five  

Suppose you want to comment from line two till line four. Go to the
beginning of "line two" and type the following after you are in the
command mode  

    ::::vim  
    :.,/line four/ s/^/#/g  

