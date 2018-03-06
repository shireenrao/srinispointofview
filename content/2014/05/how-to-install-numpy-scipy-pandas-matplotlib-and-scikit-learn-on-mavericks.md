Title: How to install numpy scipy pandas matplotlib and scikit-learn on Mavericks
Date: 2014-05-19 23:08
Author: srini
Category: software
Tags: python
Slug: how-to-install-numpy-scipy-pandas-matplotlib-and-scikit-learn-on-mavericks

These are all excellent data analysis tools. I cam across some python
tutorials on data sciences and wanted to follow the examples from the
video.. so went ahead and installed these python packages. This post is
here for future reference on the hurdles I had and how I solved them and
maybe help somebody else.

1\. Make sure you have Xcode command lines tools. You can install that
by -  

    ::::bash  
    xcode-select install  

2\. Install [Homebrew](http://brew.sh) if you don't already have it. As
simple as just running this on your command line -  

    ::::bash  
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"  

3\. Run the following to make sure homebrew is installed properly. You
will be suggested to change your path so /usr/local/bin has priority

4\. Install homebrew python -  

    ::::bash  
    brew install python  
    which python  
      

you should see '/usr/local/bin/python' when you execute which python

4\. Now begin installing packages one at a time  

    ::::bash  
    brew install gfortran  
    pip install numpy  
    pip install scipy  
    pip install pandas  
    


5\. The next package I tried was matplotlib, but that failed with an
error about a file now found.. here is a part of what I saw  

    ::::bash  
    pip install matplotlib  
    # lots of install details here...  
    /usr/X11/include/ft2build.h:56:10: fatal error:
    'freetype/config/ftheader.h' file not found  
    #include <freetype/config/ftheader.h>  
    ^  
    1 error generated.  
    error: command 'clang' failed with exit status 1  
    ----------------------------------------  
    


so I installed freetype from homebrew and retried installing
matplotlib -


    ::::bash  
    brew install freetype  
    pip install matplotlib  
    


Unfortunately, I got the same error. I saw a solution on stack overflow
to create a symlink to the freetype directory in the expected location.


    ::::bash  
    sudo ln -s /usr/X11/include/freetype2/freetype/
    /usr/X11/include/freetype  
    pip install matplotlib  
    


It worked this time. It's a hack to do it this way.. just remember you
did this. If the package gets updated later, just remember to remove
this link and try installing the normal way.

6\. Install scikit-learn


    ::::bash  
    pip install scikit-learn  
    


7\. In case you want to play with iPython notebook, you would need the
following -  

    ::::bash  
    pip install ipython  
    pip install tornado  
    pip install pyzmq  
    pip install jinja2  
    


Thats it.. you now have all scientific packages installed!!

You could also take the easier route and install one of the following
python distributions -

-   [Anaconda](https://store.continuum.io/cshop/anaconda/) from
    Continuum Analytics
-   [Enthought Canopy](https://www.enthought.com/products/canopy/)

Happy Data hacking!
