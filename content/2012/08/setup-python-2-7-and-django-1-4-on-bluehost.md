Title: Setup Python 2.7, Django 1.4 with virtualenv and virtualenvwrapper on Bluehost
Date: 2012-08-03 15:03
Author: srini
Category: software
Tags: python
Slug: setup-python-2-7-and-django-1-4-on-bluehost

I am pretty excited about learning django. As part of the development
process, I wanted to see what it takes to host a django app and thought
it would be a good exercise to try it out on my domain. In order to do
this, you need shell access. A very important point to make is that the
steps below have been edited slightly. I changed the location and my
username to be /home/username. You have to replace this to whatever is
your location and username on bluehost.

Here are the steps I took to first install Python. The reason I am doing
this is so I may have multiple versions of python.


    ::::bash  
    [~]# mkdir python  
    [~]# cd python  
    [~/python]# mkdir src  
    [~/python]# cd src  
    [~/python/src]# wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz  
    [~/python/src]# tar xvfz Python-2.7.3.tgz  
    [~/python/src]# cd Python-2.7.3  
    [~/python/src/Python-2.7.3]# mkdir ~/python/python27  
    [~/python/src/Python-2.7.3]# ./configure -prefix=/home/username/python/python27  
    [~/python/src/Python-2.7.3]# make  
    [~/python/src/Python-2.7.3]# make install  
    [~/python/src/Python-2.7.3]# cd ..  
      

Now add the new python bin to your path by adding the following line to
your .bashrc file  

    ::::bash  
    export PATH=$HOME/python/python27/bin:$PATH  
      

Source the .bashrc file and use the which command to confirm the
location of python  

    ::::bash  
    [~/python/src]# source ~/.bashrc  
    [~/python/src]# which python  
    /home/username/python/python27/bin/python  
      

Now install pip to make life easy. The prerequisite is to install
setuptools first.  

    ::::bash  
    [~/python/src]# wget http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz  
    [~/python/src]# tar xvfz setuptools-0.6c11.tar.gz  
    [~/python/src]# cd setuptools-0.6c11  
    [~/python/src/setuptools-0.6c11]# python setup.py install  
    [~/python/src/setuptools-0.6c11]# cd ..  
    [~/python/src]# wget http://pypi.python.org/packages/source/p/pip/pip-1.1.tar.gz  
    [~/python/src]# tar xvfz pip-1.1.tar.gz  
    [~/python/src]# cd pip-1.1  
    [~/python/src/pip-1.1]# python setup.py install  
    [~/python/src/pip-1.1]# cd  
      

Using virtualenv and virtualenvwrapper makes development on multiple
projects so much better. I wont go into details here on why this is
good.. but trust me on this! Here are the instructions on installing
them -  

    ::::bash  
    [~]# pip install virtualenv  
    [~]# pip install virtualenvwrapper  
      

Create a directory to keep all your virtual environments -  

    ::::bash  
    [~]# mkdir .virtualenvs  
      

Now add virtualenvwrapper.sh script to your .bashrc files to add the
virtualenvwrapper functions to your environment. Add the following line
to your .bashrc. Don't forget the dot in front of the path.  

    ::::bash  
    . /home/username/python/python27/bin/virtualenvwrapper.sh  
      

Source the .bashrc file to activate the functions. Then go ahead and
create your virtualenv. I am gonna call mine mydjango.  

    ::::bash  
    [~]# source .bashrc  
    [~]# mkvirtualenv mydjango  
      

Running the which command will tell you which python you are using.
Your prompt will also change to show the virtualenv you are using.  

    ::::bash  
    (mydjango) [~]# which python  
    /home/username/.virtualenvs/mydjango/bin/python  
      

Now go ahead install all the packages needed for Django while you are
in your virtualenv.  

    ::::bash  
    (mydjango) [~]# pip install Django  
    (mydjango) [~]# pip install MySQL-python  
    (mydjango) [~]# pip install flup  
      

Now that all requirements are done, we can start our django project.
Lets start with creating a location where all your projects will live. I
chose to put this under django_projects in my home directory. I then go
in that directory and start a new project and call it myproject.  

    ::::bash  
    (mydjango) [~]# mkdir django_projects  
    (mydjango) [~]# cd django_projects  
    (mydjango) [~/django_projects]# django-admin.py startproject myproject  
      

I now create a directory in my public_html folder. This is so that the
project is visible using the url http://www.mydomain.com/myproject  

    ::::bash  
    (mydjango) [~/django_projects]# mkdir ~/public_html/myproject  
    (mydjango) [~/django_projects]# cd ~/public_html/myproject  
      

Now we will create an fcgi file in your public folder. Lets call it
mysite.fcgi. This is to redirect and execute your project. Make note of
the first line.. We need to point the script to the python in the
virtualenv we created earlier. We will also add the project and
virtualenv python instance to the python path..  

    ::::bash  
    #!/home/username/.virtualenvs/mydjango/bin/python  
    import sys, os
    
    # Add a custom Python path.  
    sys.path.insert(0, "/home/username/.virtualenvs/mydjango")  
    sys.path.insert(13, "/home/username/django_projects/myproject")  
    os.environ['DJANGO_SETTINGS_MODULE'] = 'myproject.settings'  
    from django.core.servers.fastcgi import runfastcgi  
    runfastcgi(method="threaded", daemonize="false")  
      

Another point which I initially missed was when I created the file
mysite.fcgi. When setting the DJANGO_SETTINGS_MODULE, make sure it is
set to the name of your project. In this example, I put it as the same
name as my django project + .settings which is myproject.settings.

Make sure to set the permissions on the file  

    ::::bash  
    (mydjango) [~/public_html/myproject]# chmod 755 mysite.fcgi  
      

Now create a .htaccess file in the same place -  

    ::::bash  
    AddHandler fcgid-script .fcgi  
    RewriteEngine On  
    RewriteCond %{REQUEST_FILENAME} !-f  
    RewriteRule ^(.*)$ mysite.fcgi/$1 [QSA,L]  
      

Now turn off your virtualenv with the deactivate command.  

    ::::bash  
    (mydjango) [~/public_html/myproject]# cd  
    (mydjango) [~]# deactivate  
    [~]#  
    


Now if you go to http://www.yourdomain.com/myproject/ you should see
your standard Django-powered page.

Here are the sources I used to get this to work. Thanks for all the
help!  

http://simplyargh.blogspot.com/2012/04/python-27-django-14-on-bluehost.html  
http://alextreppass.co.uk/getting-django-working-on-bluehost  

http://blog.ruedaminute.com/2011/01/2011-installation-instructions-for-django-on-bluehost/
