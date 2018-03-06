Title: How to pip install python packages offline
Date: 2014-06-04 17:18
Author: srini
Category: software
Tags: python
Slug: how-to-pip-install-python-packages-offline

You may wonder why would you even need to do that.. Well in my case, I
was using virtualenv for a project I was working on and when it came
time to install the needed python packages, I realized I was on a train
with no internet connection. I had those packages installed on my
system, but not in my virtualenv. That put the kibosh on my work that
day. So when I found that you can actually create a kind of a local
repository on your computer so you could then pip install from that
location.. I was excited!!

Start by deciding where would that location be. I put it as a dot
directory in my home folder on my mac. The dot folder makes it a hidden
folder so it doesn't clutter your finder window. I called my location
.mypypi. So for instance if you wanted to make sure your virtualenv
should have ipython, ipdb and django whenever you create it, you would
first need to download it into your pypi repository you created. I would
do the following


    ::::bash  
    $ mkdir .mypypi  
    $ pip install --download $HOME/.mypypi ipython ipdb django  
    Downloading/unpacking ipython  
    Downloading ipython-2.1.0-py2-none-any.whl (2.8MB): 2.8MB downloaded  
    Saved ./.mypypi/ipython-2.1.0-py2-none-any.whl  
    Downloading/unpacking ipdb  
    Downloading ipdb-0.8.zip  
    Saved ./.mypypi/ipdb-0.8.zip  
    Running setup.py
    (path:/private/var/folders/qk/qk0fnpvd7jg3z8cp48ph2pvw0000gn/T/pip_build_shireenrao/ipdb/setup.py)
    egg_info for package ipdb
    
    Downloading/unpacking django  
    Downloading Django-1.6.5-py2.py3-none-any.whl (6.7MB): 6.7MB
    downloaded  
    Saved ./.mypypi/Django-1.6.5-py2.py3-none-any.whl  
    Downloading/unpacking gnureadline (from ipython)  
    Downloading gnureadline-6.3.3-cp27-none-macosx_10_9_x86_64.whl
    (132kB): 132kB downloaded  
    Saved ./.mypypi/gnureadline-6.3.3-cp27-none-macosx_10_9_x86_64.whl  
    Successfully downloaded ipython ipdb django gnureadline  
    Cleaning up...  
    

The above command will also make sure all dependencies are also
downloaded. The command also will take a requirements file. Just put "-r
requirements.txt" instead of the package name in the above pip install
command.

Now when you are in your virtualenv and are ready to install your
packages, this is all you have to do -


    ::::bash  
    $ pip install --no-index --find-links=file:/$HOME/.mypypi ipython
    ipdb django  
    Ignoring indexes: https://pypi.python.org/simple/  
    Downloading/unpacking ipython  
    Downloading/unpacking ipdb  
    Running setup.py
    (path:/Users/shireenrao/mydev/python/temp/build/ipdb/setup.py) egg_info
    for package ipdb
    
    Downloading/unpacking django  
    Downloading/unpacking gnureadline (from ipython)  
    Installing collected packages: ipython, ipdb, django, gnureadline  
    Running setup.py install for ipdb
    
    Installing ipdb script to /Users/shireenrao/mydev/python/temp/bin  
    Successfully installed ipython ipdb django gnureadline  
    Cleaning up...  
    
Boom!! It's done!!

Again, the above command also works with "-r requirements.txt" instead
of the python package name.
