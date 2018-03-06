Title: My Code Editors on Mountain Lion
Date: 2012-08-26 14:12
Author: srini
Category: software
Tags: mac
Slug: my-code-editors-on-mountain-lion-2

I started playing with [sublimetext2](http://www.sublimetext.com/2)
sometime before I upgraded to Mountain Lion. I liked it a lot. Specially
for python programming.

In order to be able to invoke it from the terminal, I created a sym link
to my bin directory. Just make sure your bin folder is in your path. You
can do that by adding this to your .bash_profile  

    ::::bash  
    export PATH=$HOME/bin:$PATH  

The other editor I like to use is
[TextWrangler](http://www.barebones.com/support/textwrangler/). After I
installed it from the apple app store, I found out that the command line
tools are not available if you get this from the app store.. something
about not being upto apples standards. You can install the command line
tools by going to their
[site](http://www.barebones.com/support/textwrangler/).

Once installed, you now use the edit command to open textwrangler from
the terminal.

The below command will open the file.  

    ::::bash  
    $ edit filename  

Something to keep in mind is that if you already have a textwrangler
session open, it will open the file in the same session. If you want a
new window use the following command  

    ::::bash  
    $ edit --new-window filename  

If you want multiple files  

    ::::bash  
    $ edit --separate-windows file1 file2  
    

