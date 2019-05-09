Title: Python development setup on Mountain Lion - part 4
Date: 2013-02-18 09:31
Author: srini
Category: software
Tags: mac, python
Slug: python-development-setup-on-mountain-lion-part-4

#### Setup Git on mountain lion to use github to save your projects

Continuing on my series, today we will be setting up git on our newly
upgraded Mountain Lion.  
Go ahead and download the latest version of git from
[here](http://git-scm.com). Go ahead and install it. Next go and open an
account on GitHub if you don't already have one.

We will be using SSH keys to establish a secure connection between our
computer and GitHub. Just follow these excellent instructions as
described at <https://help.github.com/articles/generating-ssh-keys>

Just confirm that once you have it setup you can run the following
command and see the output as shown below -  

    ::::bash  
    $ ssh -T git@github.com  
    The authenticity of host 'github.com (207.97.227.239)' can't be
    established.  
    RSA key fingerprint is
    16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.  
    Are you sure you want to continue connecting (yes/no)?  
      

Just type yes and hit enter to add the RSA key for github.com to your
list of known_hosts. You should then see the following -  

    ::::bash  
    Warning: Permanently added 'github.com,207.97.227.239' (RSA) to the
    list of known hosts.  
    Hi username! You've successfully authenticated, but GitHub does not
    provide shell access.  
      

That's it! You can now checkin and checkout code to GitHub.

If I want to clone the mp3cleaner project from Github, I will cd to the
location where I will want the project to be copied. I then run the git
clone command.


    ::::bash  
    $ git clone git@github.com:shireenrao/mp3cleaner.git  
    Cloning into 'mp3cleaner'...  
    remote: Counting objects: 11, done.  
    remote: Compressing objects: 100% (9/9), done.  
    remote: Total 11 (delta 2), reused 10 (delta 1)  
    Receiving objects: 100% (11/11), 4.15 KiB, done.  
    Resolving deltas: 100% (2/2), done.  
    


Now you can make any changes or add any files. If you are adding new
files you will have to use the command  

    ::::bash  
    $ git add filename  
      

to add the file to source control. To commit the changes you made, use
the command  

    ::::bash  
    $ git commit -a  
      

This will open your favorite editor to make a comment on what you are
committing.  
Now use this command to push your changes out to GitHub  

    ::::bash  
    $ git push  


Now if you have a new project you want to push to GitHub, you first
login to your github account and create a repository for the project you
are working on. You should see a button on the home screen of Github
which says "New repository" -  


[![Screen Shot 2013-02-18 at 8.56.51 AM]({static}/wp-content/uploads/2013/02/Screen-Shot-2013-02-18-at-8.56.51-AM.png)]({static}/wp-content/uploads/2013/02/Screen-Shot-2013-02-18-at-8.56.51-AM.png)  


Now fill out the repository name. The other fields are all optional.  


[![Screen Shot 2013-02-18 at 9.03.43
AM]({static}/wp-content/uploads/2013/02/Screen-Shot-2013-02-18-at-9.03.43-AM.png)]({static}/wp-content/uploads/2013/02/Screen-Shot-2013-02-18-at-9.03.43-AM.png)  


Click on the Create repository button to create your repository. Thats
all you need to do on github.  
For the sake of this article, lets call this repo "Hello-World"

Now back on your mac's terminal go to where your project lives,
initialize your repo locally. Create an empty README file if it doesnt
exist already. Add all files to your local repo. Commit your changes and
then create a remote named "origin" pointing at your GitHub repo. The
last step is to push your changes to github.  

    ::::bash  
    $ cd ~/projects/Hello-World  
    $ git init  
    $ touch README  
    $ git add *  
    $ git commit -m 'first commit'  
    $ git remote add origin https://github.com/username/Hello-World.git  
    $ git push origin master  


Now if you go see your repository on github, you should see your files
there.

Enjoy!
