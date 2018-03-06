Title: How to change admin email address @boxXXX.bluehost.com to @mydomain.com on a bluehost hosted wordpress
Date: 2010-02-10 20:12
Author: srini
Category: software
Tags: tips, Wordpress
Slug: how-to-change-admin-email-address-boxxxx-bluehost-com-to-mydomain-com-on-a-bluehost-hosted-wordpress

/** Update 04/13/2014  
**I now have an updated and better method to do this. Follow details in
my [post](/2014/04/change-wordpress-wp_mail-using-a-plugin/)**.  
**/

I currently have hosting through bluehost.com. I was surprised to see
all blog notification emails were coming from
username@boxXXX.bluehost.com instead of the email address defined during
setup. After a lot of searching online and trying out different things,
I think this bug is due to a combination of my hosting company bluehost
and wordpress. I found a couple of ways to fix this -

1.  Use an smtp plugin to define the Sender email. You can search for
    them on wordpress.
2.  Create a wordpress@mydomain.com email address where mydomain.com is
    the domain where you are hosting wordpress. This is the default
    email address used by wordpress which is hard coded in the wordpress
    code. This is used when wordpress can't figure out the admin email
    address.
3.  Modify the php.ini from your bluehost cpanel to have a default email
    address. The reasoning behind this is that wordpress uses the php
    mail() function and you are defining the sender in the php settings
    file. By modifying this, you are defining the default email for all
    youu php based sites. Modify the variable to appear like the
    following:  
    sendmail_path = "/usr/sbin/sendmail -t -i -f'myemail@mydomain.com'
    "
4.  Dig into the wordpress code and set the email address to your
    desire.

There are pros and cons on each method. Going the plugin route is the
easiest way, but the con on that method is that if one looked at the
header of the email, they would see the ugly bluehost email addres.

Creating the wordpress@mydomain.com address is also another easy way to
fix this. The con on this method is - If you have multiple wordpress
installations you only get one default admin address to share between
the two install. I didn't want that. That's also why the third option
wouldn't work for me.

You know me, I went with the 4th option :)

You need to edit the file /wp-includes/pluggable.php located in your
wordpress installation.

Search for this code snippet  

    ::::php
    if ( !isset( $from_email ) ) {  
        // Get the site domain and get rid of www.  
        $sitename = strtolower( $_SERVER['SERVER_NAME'] );  
        if ( substr( $sitename, 0, 4 ) == 'www.' ) {  
            $sitename = substr( $sitename, 4 );  
        }
        
        $from_email = 'wordpress@' . $sitename;  
    }  
      

and replace with the email address of your choice. e.g.
myemail@mydomain.com  

    ::::php 
    /*if ( !isset( $from_email ) ) {  
        // Get the site domain and get rid of www.  
        $sitename = strtolower( $_SERVER['SERVER_NAME'] );  
        if ( substr( $sitename, 0, 4 ) == 'www.' ) {  
            $sitename = substr( $sitename, 4 );  
        }
        
        $from_email = 'wordpress@' . $sitename;  
    }*/  
    $from_email = 'myemail@mydomain.com';  
      

in the same file, look for  

    ::::php
    $wp_email = 'wordpress@' .  preg_replace('#^www.#', '', strtolower($_SERVER['SERVER_NAME']));  
      

and replace with  

    ::::php
    //$wp_email = 'wordpress@' .  preg_replace('#^www.#', '', strtolower($_SERVER['SERVER_NAME']));  
    $wp_email = 'myemail@mydomain.com';  
      

That's it!! Now all your notifications will go from
myemail@mydomain.com instead of the ugly username@boxXXX.bluehost.com.
If anybody knows of a better way to do this, do let me know.
