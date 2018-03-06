Title: Compile Vim 7.3 with +clientserver feature on Mac OS X
Date: 2013-08-08 22:56
Author: srini
Category: software
Tags: vim
Slug: compile-vim-7-3-with-clientserver-feature-on-mac-os-x

I have been using vim for the longest time but I know I am not the most
efficient and fastest vim user. My interest in vim recently started
after I watched a youtube video on how to use vim as a Python IDE. Here
is a link to the [video](https://www.youtube.com/watch?v=YhqsjUUHj6g).
Here is the link to Martin's github
[repo](https://github.com/mbrochh/vim-as-a-python-ide).

Seeing this video, I saw that you can build vim from source and have it
built with python features. Below I show how I built it and installed
this under my home directory in $HOME/opt/vim. I then added a sym link
to my bin directory under my home directory. As the bin directory is in
my path, the built version of vim gets invoked.

    ::::bash  
    $ wget wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2  
    $ tar xvjf vim-7.3.tar.bz2  
    $ cd vim73  
    $ ./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim  
    $ make  
    $ make install  
    $ cd ~/bin  
    $ ln -s $HOME/opt/vim/bin/vim vim  
    $ ln -s $HOME/opt/vim/bin/vi vi  


This led me to further learn new features/tips and tricks in using vim.
I then found Derek Wyatt's excellent and entertaining [vim
tutorials](http://www.derekwyatt.org/vim/vim-tutorial-videos/). It has
ignited the desire to learn the editor properly. One of the features I
found out about was the ability to edit multiple files. These files can
be based on some filter on your file system by using the grep command
(My next post will talk about this feature and how I saved the day at
work by editing files based on grep). Unfortunately the feature Derek
talks about needs vim to have the +clientserver feature built in.

Unfortunately the above build did not add that feature, even thought I
have --with-features=huge set. After some googling around, I found that
all I had to do was configure the build slight differently. I just have
to add the flag --enable-gui=gtk2 to the configure command.


    ::::bash  
    $ cd vim73  
    $ make distclean  
    $ ./configure --enable-pythoninterp --with-features=huge --enable-gui=gtk2 --prefix=$HOME/opt/vim
    $ make  
    $ make install  


Now you have vim with clientserver features. I will have more updates
coming about vim soon. Keep posted!
