Title: Hit by AV.EXE virus - Cannot run any programs
Date: 2010-03-09 20:58
Author: srini
Category: software
Tags: virus, windows
Slug: hit-by-av-exe-virus

I recently got hit by the AV.EXE virus. This was a really bad virus. I
got a pop up which looked as if it was a windows dialogue box telling me
to install this anti spyware/virus scanner. I knew I should not even
touch the popup box and not even try to close it. The best way was to
kill the process. I used System Explorer which is a really good task
manager replacement. It is available from
<http://systemexplorer.mistergroup.org/>. Once killed, I wanted to make
sure I wasn't infected any further, so I started my spyware scanner
called [Malwarebytes' Anti-Malware](http://www.malwarebytes.org/).  
Surprisingly the AV.EXE popup came back and on top of that, my
malwarebytes program didn't start. I killed the process once again and
tried starting malwarebytes again and the av.exe popup came back!! Damn
what was going on!! After killing the process once again I tried
Superantispyware and it too had the same fate... I was now perplexed...
I tried a random program and after seeing that too starting the popup,
finally realized that my registry had been compromised. The virus had
modified my registry in such a way that it would get enabled whenever I
would start any executable. I then thought I better do more research on
this before I screw up my machine even further. Here is what I found

-   I had to right click the Malwarebytes program and use Run as.. to
    run the program as administrator
-   Update the program and run it and remove any instance of the virus
-   Cleaning the system broke my registry. I couldn't run any programs
    anymore.
-   The registry was fixed with the following file. Save the following
    in a file called fixit.reg  

        ::::dos  
        Windows Registry Editor Version 5.00
    
        [HKEY_CLASSES_ROOT\.EXE]  
        @="exefile"  
        "Content Type"="application/x-msdownload"
    
        [HKEY_CLASSES_ROOT\.EXE\PersistentHandler]  
        @="{098f2470-bae0-11cd-b579-08002b30bfeb}"
    
        [HKEY_CLASSES_ROOT\exefile]  
        @="Application"  
        "EditFlags"=hex:38,07,00,00  
    
        "FriendlyTypeName"=hex(2):40,00,25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,\  
    
        00,6f,00,6f,00,74,00,25,00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,\  
    
        32,00,5c,00,73,00,68,00,65,00,6c,00,6c,00,33,00,32,00,2e,00,64,00,6c,00,6c,\  
        00,2c,00,2d,00,31,00,30,00,31,00,35,00,36,00,00,00
    
        [HKEY_CLASSES_ROOT\exefile\DefaultIcon]  
        @="%1"
    
        [HKEY_CLASSES_ROOT\exefile\shell]
    
        [HKEY_CLASSES_ROOT\exefile\shell\open]  
        "EditFlags"=hex:00,00,00,00
    
        [HKEY_CLASSES_ROOT\exefile\shell\open\command]  
        @="\"%1\" %*"  
        "IsolatedCommand"="\"%1\" %*"
    
        [HKEY_CLASSES_ROOT\exefile\shell\runas]
    
        [HKEY_CLASSES_ROOT\exefile\shell\runas\command]  
        @="\"%1\" %*"  
        "IsolatedCommand"="\"%1\" %*"
    
        [HKEY_CLASSES_ROOT\exefile\shellex]
    
        [HKEY_CLASSES_ROOT\exefile\shellex\DropHandler]  
        @="{86C86720-42A0-1069-A2E8-08002B30309D}"
    
        [-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.exe\UserChoice]  
        


-   Double click and execute this file. This fixes the registry

I think I should start browsing in a sandbox so I don't infect my pc. I
have a couple of options, but I think the easiest is to just use
Sandboxie which is available at <http://www.sandboxie.com/>. Other ways
I can protect myself is to use a limited user account instead of using
an admin account. Ohh well...
