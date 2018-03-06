Title: MAMP - mysqlcheck: Got error: 1045
Date: 2011-03-28 13:18
Author: srini
Category: software
Tags: php
Slug: mamp-mysqlcheck-got-error-1045

I started seeing the following error every time I started MAMP. This
began after I changed the root password for my MAMP installation on my
MBP.

[![Mamp Error Msg]({filename}/wp-content/uploads/2011/03/Screen-shot-2011-03-28-at-1.10.32-PM-300x151.png "MAMP Error msg")]({filename}/wp-content/uploads/2011/03/Screen-shot-2011-03-28-at-1.10.32-PM.png)


    ::::text  
    /Applications/MAMP/Library/bin/mysqlcheck: Got error: 1045: Access
    denied for user 'root'@'localhost' (using password: YES) when trying to
    connect  
    


It turns out that the default password is hard coded in different
scripts under '/Applications/MAMP/bin'. In my case the script
quickCheckMysqlUpgrade.sh. Just edit the script to have the correct
password and you wont see the annoying message again.
