Title: Change wordpress wp_mail using a plugin
Date: 2014-04-13 21:53
Author: srini
Category: software
Tags: Wordpress
Slug: change-wordpress-wp_mail-using-a-plugin

Hosting wordpress on bluehost has been nice except for one problem. All
notifications from my wordpress come out weird. The domain name of the
sender does not show up as my domain name. It shows up as
username@box###.BlueHost.com as explained
[here](https://my.bluehost.com/cgi/help/206).

I had figured out a way to fix this by editing some core wordpress
scripts and had shared my method in a previous
[post]({filename}/2010/02/how-to-change-admin-email-address-boxxxx-bluehost-com-to-mydomain-com-on-a-bluehost-hosted-wordpress.md).
It was working out fine, except for one small problem.. Every time
wordpress got updated, I would loose my fix and I would have to make
those changes again.

I then found out, I could use filters to over-ride two variable
wp_mail_from and wp_mail_from_name which would do exactly what I
wanted. I then did some digging to understand how wordpress plugins work
to write my own plugin. I also wanted the ability to have my own plugin
settings page, just so I can set the email address and name and have it
saved in the internal wordpress database instead of having it hard coded
in the plugin. These two excellent tutorials on plugins helped me a
lot -
[here](http://www.smashingmagazine.com/2011/09/30/how-to-create-a-wordpress-plugin/)
and
[here](http://code.tutsplus.com/tutorials/create-a-custom-wordpress-plugin-from-scratch--net-2668).

Thus was born the plugin
[email-over-rider](https://github.com/shireenrao/wp-email-over-rider).
Just download the zip and upload the plugin and activate it. Then go to
the Settings area in your wordpress admin section and you should see the
Email Over-rider sub menu. Just set the required email address and Name
and you are set. No need to update the wordpress code everytime
wordpress gets updated.

If plugins are not your cup of tea, you could also just add the filters
to your themes functions.php file. The entire method is explained very
nicely
[here](http://www.butlerblog.com/2011/07/08/changing-the-wp_mail-from-address-in-wordpress-without-a-plugin/).
