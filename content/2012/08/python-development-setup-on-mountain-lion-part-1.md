Title: Python development setup on Mountain Lion - part 1
Date: 2012-08-27 14:13
Author: srini
Category: software
Tags: mac, python
Slug: python-development-setup-on-mountain-lion-part-1

#### Install and manage multiple versions of Python on Mountain Lion

When I was doing python development on snow leopard, I was installing
python modules up the wazoo on the default python which came with the
laptop. I later realized that was not the right way of doing it. To keep
things organized will help you when you are developing projects which
have different requirements and using different modules and different
versions. So when I installed mountain lion on my laptop, I thought this
time around I will be more organised about this.

I didn't want to mess with the system python, so I installed python2.7.3
and python 3.2.3 from python.org. After each install, the installation
process is going to try to add that version of python in your path on
the command line. I recommend commenting the lines which were added to
your .bash_profile

Now one would wonder how would you switch between the different versions
of python? This is where I found this cool script called
update_python_switchers.py from
<http://sevas.github.com/2011/06/14/multiple-python-osx.html>

When you execute this script, it creates a file called
.python_switchers.sh in your home directory. This script detects all
the different versions of python and then creates bash functions based
on what were found. To make these functions available, just source this
file. As recommended on the site just add the following to your
.bash_profile  

    ::::bash  
    export OLD_PATH=$PATH
    
    . $HOME/.python_switchers.sh  


When I ran the script update_python_switchers.py, I saw the following
error in the execution.


    ::::bash  
    Using generic prompt  
    Adding System Python 2.3  
    Adding System Python 2.5  
    Adding System Python 2.6  
    Adding System Python 2.7  
    Adding MacPython 2.7  
    Adding MacPython 3.2  
    Adding EPD 32 7.3  
    Traceback (most recent call last):  
    File "./update_python_switchers.py", line 152, in <module>  
    epd64_versions = detect_epd64_installs()  
    File "./update_python_switchers.py", line 48, in
    detect_epd64_installs  
    directories = os.listdir(os.path.join(EPD64_ROOT, "Versions"))  
    OSError: [Errno 2] No such file or directory:
    '/Library/Frameworks/EPD64.framework/Versions'  


Looks like the script is failing because the script is trying to look
for the 64 bit version of Enthought Python. As I don't have it, I just
commented out the call to detect_epd64_installs() in the script. Now
running the script gives me the following output  

    ::::bash  
    Using generic prompt  
    Adding System Python 2.3  
    Adding System Python 2.5  
    Adding System Python 2.6  
    Adding System Python 2.7  
    Adding MacPython 2.7  
    Adding MacPython 3.2  
    Adding EPD 32 7.3  
    Saved python switcher bash functions to
    /Users/username/.python_switchers.sh  

where I replaced my real username with username. As you can see I have
a lot of versions of python installed.  
Just source the .python_switchers.sh in your home directory and now
you should have all the versions of python available to you on a press
of a bash function really quickly. All that function is doing is adding
the version of python to the beginning of your path.  
Type 'typeset -F' on the command line to see all bash functions
available. In my case I see  

    ::::bash  
    declare -f select_epd_32_73  
    declare -f select_macpython_27  
    declare -f select_macpython_32  
    declare -f select_system_python_23  
    declare -f select_system_python_25  
    declare -f select_system_python_26  
    declare -f select_system_python_27  


I can now use any of these functions to switch to any of the versions of
python installed on my laptop. Typing the function select_macpython_27
will make python 2.7.3 be my default version.

One other change I did to the script update_python_switchers.py was to
comment out code which was modifying my command prompt. I like my
default prompt. I can easily tell what is my version of python by
running the command 'python --version'.

In part 2 I will go through setting up virtualenv and
virtualenvwrapper..
