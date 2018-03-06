Title: Join multiple mpg files into one file
Date: 2011-03-23 22:19
Author: srini
Category: software
Tags: mpeg, tips, videos
Slug: join-multiple-mpg-files-into-one-file

I did not realize how easy it is to join mpeg files with just the
windows copy command or unix cat command.

On windows the trick is to copy the files while preserving the binary
format. Here is how you would do it -  

    ::::dos  
    copy files1.mpg /b + files2.mpg /b joinedfile.mpg  

You could also do the following if the files are named consecutively  

    ::::dos  
    copy file*.mpg /b joinedfile.mpg  
    

On UNIX it couldn't be any simpler..  

    ::::bash  
    cat file1.mpg file2.mpg > joinedfile.mpg  
      

or  

    ::::bash  
    cat file*.mpg > joinedfile.mpg  
    

