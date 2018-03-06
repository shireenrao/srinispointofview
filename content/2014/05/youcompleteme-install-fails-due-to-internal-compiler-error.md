Title: YouCompleteMe install fails due to internal compiler error
Date: 2014-05-18 15:44
Author: srini
Category: software
Tags: linux, vim
Slug: youcompleteme-install-fails-due-to-internal-compiler-error

While I was trying to set up my development environment on a vagrant vm,
I saw a compiler error while installing the excellent YouCompleteMe vim
plugin. Well let me back up a bit..  
You install the plugin using
[Vundle](https://github.com/gmarik/Vundle.vim). After the plugin is
installed you need to run a script to compile YCM with semantic support
for C-family languages:


    ::::bash  
    cd ~/.vim/bundle/YouCompleteMe  
    ./install.sh --clang-completer  
    


My install was failing with this wierd error -


    ::::bash  
    [ 75%] Building CXX object
    BoostParts/CMakeFiles/BoostParts.dir/libs/thread/src/pthread/thread.cpp.o  
    Linking CXX static library libBoostParts.a  
    [ 75%] Built target BoostParts  
    Scanning dependencies of target ycm_core  
    [ 77%] Building CXX object
    ycm/CMakeFiles/ycm_core.dir/CustomAssert.cpp.o  
    [ 77%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Utils.cpp.o  
    [ 78%] Building CXX object
    ycm/CMakeFiles/ycm_core.dir/ClangCompleter/ClangCompleter.cpp.o  
    c++: internal compiler error: Killed (program cc1plus)  
    Please submit a full bug report,  
    with preprocessed source if appropriate.  
    See <file:///usr/share/doc/gcc-4.8/README.Bugs> for instructions.  
    make[3]: ***
    [ycm/CMakeFiles/ycm_core.dir/ClangCompleter/ClangCompleter.cpp.o] Error
    4  
    make[2]: *** [ycm/CMakeFiles/ycm_core.dir/all] Error 2  
    make[1]: *** [ycm/CMakeFiles/ycm_support_libs.dir/rule] Error 2  
    make: *** [ycm_support_libs] Error 2  
    


Looking for a solution to the problem, I came across the
[same](https://github.com/Valloric/YouCompleteMe/issues/267) issue on
github. Basically I was running out of memory on my VM while compiling
the plugin. Somebody hinted on adding swap space would help. So I used
this script to add swap file -


    ::::bash  
    #!/bin/sh
    
    # size of swapfile in megabytes  
    swapsize=512
    
    # does the swap file already exist?  
    grep -q "swapfile" /etc/fstab
    
    # if not then create it  
    if [ $? -ne 0 ]; then  
        echo 'swapfile not found. Adding swapfile.'  
        fallocate -l ${swapsize}M /swapfile  
        chmod 600 /swapfile  
        mkswap /swapfile  
        swapon /swapfile  
        echo '/swapfile none swap defaults 0 0' >> /etc/fstab  
    else  
        echo 'swapfile found. No changes made.'  
    fi
    
    # output results to terminal  
    cat /proc/swaps  
    cat /proc/meminfo | grep Swap  
    


Now go ahead and compile YouCompleteMe to Success :)

You can delete the swap file if you don't need it. Here use this
script -


    ::::bash  
    #!/bin/sh
    
    # does the swap file exist?  
    grep -q "swapfile" /etc/fstab
    
    # if it does then remove it  
    if [ $? -eq 0 ]; then  
        echo 'swapfile found. Removing swapfile.'  
        sed -i '/swapfile/d' /etc/fstab  
        echo "3" > /proc/sys/vm/drop_caches  
        swapoff -a  
        rm -f /swapfile  
    else  
        echo 'No swapfile found. No changes made.'  
    fi
    
    # output results to terminal  
    cat /proc/swaps  
    cat /proc/meminfo | grep Swap  

I got the scripts from
[here](http://programmaticponderings.wordpress.com/2013/12/19/scripting-linux-swap-space/).
