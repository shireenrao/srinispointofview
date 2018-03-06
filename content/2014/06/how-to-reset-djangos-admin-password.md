Title: How to Reset Django's admin password
Date: 2014-06-01 22:29
Author: srini
Category: software
Tags: django, python
Slug: how-to-reset-djangos-admin-password

I was working on a django application and because of getting busy at
work and home, the project took a backseat. After getting back to the
project, I realized I don't remember what was the username/password I
used to create the admin account.

Here is what I did. I started a django shell session (% is my prompt) -

    ::::bash  
    % python manage.py shell  
    Python 2.7.6 (default, Apr 9 2014, 11:48:52)  
    [GCC 4.2.1 Compatible Apple LLVM 5.1 (clang-503.0.38)] on darwin  
    Type "help", "copyright", "credits" or "license" for more information.  
    (InteractiveConsole)  
    >>> from django.contrib.auth.models import User  
    >>> users = User.objects.all()  
    >>> users  
    [<User: admin>]  

I see I had created a user called admin. Now to change the password is
easy..  

    ::::bash  
    >>> u = users[0]  
    >>> u  
    <User: admin>  
    >>> u.set_password('somepassword')  
    >>> u.save()  

As I just had one user, this was easy enough.. if you have a lot of
users, you could get the individual users object like this -

    ::::python  
    u = User.objects.get(username__exact='someusername')  
    u.set_password('somepassword')  
    u.save()  
    

