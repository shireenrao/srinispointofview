Title: Find user details on windows user in a domain
Date: 2010-03-18 10:05
Author: srini
Category: software
Tags: windows
Slug: find-user-details-on-windows-user-in-a-domain

Here is a quick tip - If you want to find out details on a user account
on windows inside a particular domain use the following command on a DOS
prompt  

    ::::dos
    net user username /domain  
      

where the username is the username of the account you want more
information on. You can get a lot of information with this simple
command. Some of the things you can find are -

>  Full Name  
>  Account information - if active, if expires  
>  Password - last set, expiry date etc  
>  last logon date and time  
>  group memberships
