Title: How to enable upload  of files over 2MB in Wordpress running on nginx
Date: 2014-06-03 16:04
Author: srini
Category: software
Tags: nginx, Wordpress
Slug: how-to-enable-upload-of-files-over-2mb-in-wordpress-running-on-nginx

I was writing a post on a chicken dish I cooked yesterday. As I was
trying to upload some pictures, I saw that the upload failed because the
files were over 2MB. This was the first time I was posting pictures on
my wordpress since I move to Digital Ocean as my hosting company. I knew
this was a limit on the php configuration on the server, so it was an
easy fix.

I logged in to my server and edited my php.ini located at
/etc/php5/fpm/php.ini. All I had to do was to change -


    ::::php  
    upload_max_filesize = 2M  

to

    ::::php  
    upload_max_filesize = 8M  
    
Now restart the following services -  

    ::::bash  
    sudo service php5-fpm reload  
    sudo service nginx reload  


I went back to trying to upload the image. This time, the upload started
to happen but I eventually saw another failure. Turns out, this time it
was from Nginx. I found that nginx throws a 413 error if a file upload
exceeds its default limit.

All you have to do to fix that is to over-ride the default in your sites
config file. In my case I add the following in my default configuration
at /etc/nginx/sites-available/default in the server block right under
server_name -

    ::::bash  
    client_max_body_size 8M;  

Restart the services again-  

    ::::bash  
    sudo service php5-fpm reload  
    sudo service nginx reload  
    


The picture uploads worked this time :)

It's been great with Digital Ocean so far.. and am really loving them!!
Highly recommend using them. These guys have great documentation and
their IRC channel on freenode are really helpful too!
