Title: SSH aliases
Date: 2011-03-23 13:07
Author: srini
Category: software
Tags: cli, tips, unix
Slug: ssh-aliases

I constantly connect to linux or unix machines using ssh and it can get
a little bothersome typing out the IP address repeatedly. Here is the
typical syntax to connect to a linux box (random IP address)

    ::::bash  
    ssh username@111.11.11.1  

Now imagine typing this again and again. Thats where the ssh config file
comes to the rescue. You can create aliases to make your connections
easy. The template for the config file \~/.ssh/config is


    ::::bash  
    Host domain  
    HostName domain.com  
    User username  


The HostName can be either an IP address or an actual hostname. So for
our example above our config file \~/.ssh/config will be  

    ::::bash  
    Host myserver  
    HostName 111.11.11.1  
    User username  
      

So now all you have to do is type the following on your command prompt
to directly connect and get prompted for a password.  

    ::::bash  
    ssh myserver  


You can create as many aliases as you want. You can also override the
settings of the config file on the command line. For instance if you
want to connect using a different user, you can do the following  

    ::::bash  
    ssh diff_user@myserver  

You can also specify your SSH keys for the server in your config file
as shown below so you don't have to enter your password  

    ::::bash  
    Host myserver  
    HostName 111.11.11.1  
    User username  
    IdentityFile ~/.ssh/id_dsa  

Click [here](http://oreilly.com/pub/h/66) or
[here](http://www.csua.berkeley.edu/~ranga/notes/ssh_nopass.html) to
read how to generate and use SSH keys.
