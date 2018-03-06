Title: Python development setup on Mountain Lion - part 2
Date: 2012-08-28 09:06
Author: srini
Category: software
Tags: mac, python
Slug: python-development-setup-on-mountain-lion-part-2

#### Setup virtualenv and virtualenvwrapper on Mountain Lion

In the previous
[part]({filename}/2012/08/python-development-setup-on-mountain-lion-part-1.md) I
went through how you can have multiple versions of python and how you
can easily switch between these versions. Here I will go through setting
up virtualenv and virtualenvwrapper. This will help in keeping all the
different versions of python pristine!

First step is to switch to whatever version of python you want to do
this in. Use the bash switch function we created in [part 1]({filename}/2012/08/python-development-setup-on-mountain-lion-part-1.md).

Next we will install the python package installer
[pip](http://pypi.python.org/pypi/pip/) using the easy_install
command.  

    ::::bash  
    $ sudo easy_install pip  
    


**Update Start (July-02-2013) ********  
The above step is not correct. On my mac, I assumed easy_install to be
part of the python version I switched to, as described earlier. When I
checked the location for easy_install, I realized that it was from the
python version shipped with mountain lion. easy_install is part of
[setuptools](https://pypi.python.org/pypi/setuptools). So we will need
to install setuptools for the version of python you are using. As I am
trying to switch to version 2.7.3, I did the following to install
this -  

    ::::bash  
    $ curl -o setuptools-0.6c11-py2.7.egg https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg  
    $ sudo sh setuptools-0.6c11-py2.7.egg  
    $ rm setuptools-0.6c11-py2.7.egg  
    


You should now see easy_install in the bin directory of the python
version you are trying to do this for. In my case for python 2.7.3 it
was in "/Library/Frameworks/Python.framework/Versions/2.7/bin". As this
is already in my path thanks due to the python switching tools I showed
you all from the [first part]({filename}/2012/08/python-development-setup-on-mountain-lion-part-1.md) in this
series, we are good. Now run "sudo easy_install pip" as first directed
and it will install pip in the right version of python.  
******** Update Finish (July-02-2013)**

Next install virtualenv and virtualenvwrapper using the pip command  

    ::::bash  
    $ sudo pip install virtualenv  
    $ sudo pip install virtualenvwrapper  
    


Now add the following variables in your .bash_profile before activating
virtualenvwrapper  

    ::::bash  
    export WORKON_HOME=$HOME/.virtualenvs  
    export PIP_VIRTUALENV_BASE=$WORKON_HOME  
    export PIP_RESPECT_VIRTUALENV=true
    
    . /usr/local/bin/virtualenvwrapper.sh  
      

Yes, there is a dot in front of /usr/local/bin/virtualenvwrapper.sh  
Next go ahead and create the directory .virtualenvs in your home
directory.  
Now that all the ground work is done, go ahead and source your
.bash_profile file. You should see virtualenvwrapper initialise some
files and folders under .virtualenvs. It will also add some more bash
functions to make your life easy.

Now lets go ahead and create a virtual environment for our python 2.7.3
environment.  

    ::::bash  
    $ mkvirtualenv python273  
    Installing setuptools...........  
    Complete output from command
    /Users/username/.v...python273/bin/python -c "#!python  
    \"\"\"Bootstra...sys.argv[1:])
    
    " /Library/Python/2.7/...ols-0.6c11-py2.7.egg:  
    Traceback (most recent call last):  
    File "<string>", line 279, in <module>  
    File "<string>", line 207, in main  
    File "build/bdist.linux-i686/egg/setuptools/__init__.py", line 2,
    in <module>  
    File "build/bdist.linux-i686/egg/setuptools/extension.py", line 1, in
    <module>  
    File
    "/Users/username/.virtualenvs/python273/lib/python2.7/distutils/__init__.py",
    line 16, in <module>  
    exec(open(os.path.join(distutils_path, '__init__.py')).read())  
    IOError: [Errno 2] No such file or directory:
    '/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/distutils/__init__.py'  
    ----------------------------------------  
    ...Installing setuptools...done.  
    Traceback (most recent call last):  
    File "/usr/local/bin/virtualenv", line 8, in <module>  
    load_entry_point('virtualenv==1.7.2', 'console_scripts',
    'virtualenv')()  
    File "/Library/Python/2.7/site-packages/virtualenv.py", line 942, in
    main  
    never_download=options.never_download)  
    File "/Library/Python/2.7/site-packages/virtualenv.py", line 1052, in
    create_environment  
    search_dirs=search_dirs, never_download=never_download)  
    File "/Library/Python/2.7/site-packages/virtualenv.py", line 598, in
    install_setuptools  
    search_dirs=search_dirs, never_download=never_download)  
    File "/Library/Python/2.7/site-packages/virtualenv.py", line 570, in
    _install_req  
    cwd=cwd)  
    File "/Library/Python/2.7/site-packages/virtualenv.py", line 1020, in
    call_subprocess  
    % (cmd_desc, proc.returncode))  
    OSError: Command /Users/username/.v...python273/bin/python -c
    "#!python  
    \"\"\"Bootstra...sys.argv[1:])
    
    " /Library/Python/2.7/...ols-0.6c11-py2.7.egg failed with error code 1  
      

Turns out this error came up because Xcode which was installed from the
App Store on my new Mountain Lion install did not come with the command
line tools. Go to the preference pane in Xcode, and then go to the
downloads section and install the command line tools. Once done, go
ahead and try the mkvirtualenv command again.


    ::::bash  
    $ mkvirtualenv python273  
    New python executable in python273/bin/python  
    Installing setuptools............done.  
    Installing pip...............done.  
    virtualenvwrapper.user_scripts creating
    /Users/username/.virtualenvs/python273/bin/predeactivate  
    virtualenvwrapper.user_scripts creating
    /Users/username/.virtualenvs/python273/bin/postdeactivate  
    virtualenvwrapper.user_scripts creating
    /Users/username/.virtualenvs/python273/bin/preactivate  
    virtualenvwrapper.user_scripts creating
    /Users/username/.virtualenvs/python273/bin/postactivate  
    virtualenvwrapper.user_scripts creating
    /Users/username/.virtualenvs/python273/bin/get_env_details  
    (python273) $ which python  
    /Users/username/.virtualenvs/python273/bin/python  
    


Notice how my prompt changed to show me which environment I am in. What
mkvirtualenv did was create a copy of python under your .virtualenv
directory and made it your default python.

There is a slight problem now. I checked to see the version of python in
the virtualenv I just created and found that the version was 2.7.2. This
was the version of python which came with the new install of Mountain
Lion. After reading the docs on mkvirtualenv I found that mkvirtualenv
used the python version which was used to install virtualenv.. but I
thought I had switched my version of python to use python 2.7.3.. Grr..
ok.. whatever!! I deleted my newly created virtualenv and recreated a
new one again, but this time define the version of python I want to use.


    ::::bash  
    $ rmvirutalenv python 273  
    Removing python273...  
    $ mkvirtualenv python273 -p
    /Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7  
    Running virtualenv with interpreter
    /Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7  
    New python executable in python273/bin/python  
    Installing setuptools............done.  
    Installing pip...............done.  
    


This confirms my python :)

**Update Start (July-02-2013) ********  
If you followed my latest update from above for confirming the
existance of easy_install in the version of python you want and
installing if missing, the problem with creating the virutalenv instance
with the wrong version of python will not happen.  
******** Update finish (July-02-2013)**

Here are some commands you will using -

-   deactivate - command will disable the virtual environment.
-   workon - command by itself will show you a list of virtual
    environments. To activate a particular environment, run 'workon
    env_name'
-   rmvirtualenv - run this command with the name of virtualenv to
    delete that environment

The best part is that now you don't need the sudo command to install any
new python modules as python is now under your home directory. You are
now free to use the pip command to install any module you want.

In the next part I will show you how to setup eclipse to use a virtual
python environment...
