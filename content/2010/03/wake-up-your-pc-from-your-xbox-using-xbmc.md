Title: Wake up your PC from your xbox using xbmc
Date: 2010-03-26 08:00
Author: srini
Category: software
Tags: cygwin, python, windows, xbmc, xbox
Slug: wake-up-your-pc-from-your-xbox-using-xbmc

I read an old
[lifehacker](http://lifehacker.com/348197/access-your-computer-anytime-and-save-energy-with-wake+on+lan)
article on wake-on-lan the other day and decided I should try it on my
home network. After using the free tool [Magic Packet
Sender](http://magicpacket.free.fr/) mentioned in the article
successfully, I thought how cool would it be to start my media server
from my xbox. I use my xbox as my media center. I know... using the xbox
is old news and it is not powerful enough for hi-definition videos...
but still.. I like my xbox and am not willing to get rid of it yet. Till
something better and cheap comes along, I am going to continue using it.
My brother bought the Acer Aspire Revo (AR3610-U9022) which comes with
the Intel Atom 330 processor. I like it a lot and boxee and xbmc both
work really well. Streaming 1080p video works flawlessly. Hulu desktop
works too, but you have to use the adobe flash 10.1 beta drivers for the
video to work. let's see what path I take.

Going back to my little project, I thought I will study what is involved
in sending a wake-on-lan packet to a PC to wake it up. I read the
lifehacker article in detail and then googled for other resourses. I
came across a really nice [resource](http://www.jibble.org/wake-on-lan/)
which explained how the wake-on-lan packet is constructed along with a
sample java program. I also found, I am not the only person who thought
about using this technology to start their media server from their xbox.
I found this script in the forums at xbmc.org. Here you go -


    ::::python  
    # Wake-On-LAN  
    #  
    # Copyright (C) 2002 by Micro Systems Marc Balmer  
    # Written by Marc Balmer, marc@msys.ch, http://www.msys.ch/  
    # This code is free software under the GPL
    
    import struct, socket
    
    def WakeOnLan(ethernet_address):
    
    # Construct a six-byte hardware address
    
    addr_byte = ethernet_address.split(':')  
    hw_addr = struct.pack('BBBBBB', int(addr_byte[0], 16),  
    int(addr_byte[1], 16),  
    int(addr_byte[2], 16),  
    int(addr_byte[3], 16),  
    int(addr_byte[4], 16),  
    int(addr_byte[5], 16))
    
    # Build the Wake-On-LAN "Magic Packet"...
    
    msg = '\xff' * 6 + hw_addr * 16
    
    # ...and send it to the broadcast address using UDP
    
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  
    s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)  
    s.sendto(msg, ('<broadcast>', 9))  
    s.close()
    
    # Example use  
    WakeOnLan('aa:bb:cc:dd:ee:ff') # My PC  

The last line in the script is calling the WakeOnLan method and passing
the MAC address of the PC you are trying to wake up. You can get the MAC
address of your PC from a DOS command prompt by the command -  

    ::::dos  
    c:\> ipconfig /all  
      

It will show up as Physical Address in the detailed listing. Read the
lifehacker article given above for more details. You can wake more than
1 by duplicating the WakeOnLan(MAC) line in the script.

You have a couple of options of executing this script. You could create
a sub-folder under the scripts folder in your XBMC install and place
this script there. In which case you can call it anything you want. I
have created a script for every PC I want to wake up in my network and
have the machine name as the script name. You could also start up all
your computers as soon as the xbox is switched on. Just name the file
autoexec.py and put it in XBMC/scripts. It's similar to how autoexec.bat
works for windows :)

I also put these scripts on every PC in my network, so I can start any
of them remotely. The pre-requisite is that you need python installed on
your PC for the script to work. You can either install python or just
use the python which comes with cygwin. I recommend that if you need a
decent command line on windows, just get cygwin and give mintty a try.
Andy Koppe the creator of mintty recommended it to me the other day and
I love it so far!! I have also further recommended it to my friends at
work. I just launch mintty to get a bash shell on my windows box and
execute the script this way -

    ::::bash  
    python /path/to/WakeOnLan.py  
    

