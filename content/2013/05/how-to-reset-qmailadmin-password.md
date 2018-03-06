Title: How to reset QmailAdmin password
Date: 2013-05-19 07:07
Author: srini
Category: software
Tags: qmail
Slug: how-to-reset-qmailadmin-password

Actually you can use this command to reset any users qmail account
password.

Simply run the following command to change the password for
user@domain.com either by using sudo or as root.

    ::::bash  
    # /home/vpopmail/bin/vpasswd user@domain.com  

The above command will ask you for the new password twice. That was
easy!
