Title: Tip on burning dual layer disc on your MacBook Pro
Date: 2012-08-28 08:10
Author: srini
Category: software
Tags: mac
Slug: tip-on-burning-dual-layer-disc-on-your-macbook-pro

You can solve this problem by disabling the sudden motion sensor on your
laptop. When the disk is going from layer 1 to layer 2, the sudden
motion sensor activates which then disrupts the burn process. So if you
want to burn a dual layer disc, disable the sensor.. But there is a
risk! If you drop you're Mac book, the superdrive will be damaged. Your
bes option would be to disable your sensor.. Burn your disc and then
finally enable the sensor again.

to disable sudden motion sensor start Terminal and type:  

    ::::bash  
    $ sudo pmset -a sms 0  
    
to reactivate type:  

    ::::bash  
    $ sudo pmset -a sms 1  
    
Another thing I found was always try to use Verbatim, all the other
brands didn't work out.
