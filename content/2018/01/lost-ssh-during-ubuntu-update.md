Title: Lost SSH During Ubuntu Update
Date: 2018-01-24 22:00
Author: srini
Category: software
Tags: linux, ubuntu
Slug: lost-ssh-during-ubuntu-update

I was trying to install security updates on my digitalocean vps and lost my ssh
connection. The one time I was not using tmux! GAH!! It was also stuck at a
stage where it was waiting for me to put in what config changes to use for some
software package (use my previous or use the default)

When I logged in again and tried to run the apt-get update again, I saw the following
error - 

    ::::bash
    E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable)
    E: Unable to lock the administration directory (/var/lib/dpkg/), is another process using it?

So had to find my running process and kill it. Even after killing it, I was
seeing the same error. Turns out I can resume my upgrade from where my ssh
connection died, using the following command - 

    ::::bash
    % sudo dpkg --configure -a


