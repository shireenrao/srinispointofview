Title: How to build Growl 2.0.1 from source on Mountain Lion 10.8.2
Date: 2013-03-10 23:16
Author: srini
Category: software
Tags: growl, mac
Slug: how-to-build-growl-2-0-1-from-source-on-mountain-lion-10-8-2

Growl is the ultimate notification system for OS X. A lot of apps
support and use growl to notify the user about any status updates. You
can either buy the app from the app store for $3.99 or build and
install from source. [This
page](http://growl.info/documentation/developer/growl-source-install.php)
explains how to build Growl from source.

(Click [here](#instructions)
to skip my ordeal and see the instructions which worked for me)

Unfortunately the instructions were not enough. I went through a lot of
issues trying to build this. This post is my ordeal in trying to build
and install Growl on my laptop.  

Here is a list of requirements as mentioned in the official build
notes -

-   OS X Mountain Lion - 10.8.2
-   Xcode - 4.6
-   Mercurial Client - I used the one from
    [here](http://mercurial.berkwood.com/)
-   Git Client

We will now pull down the source code using mercurial to an appropriate
location on our mac. I have a directory called projects where I do all
my development. You may do this, where ever you want under your home.

Open a terminal window and execute the following


    ::::bash  
    $ export LC_ALL="en_US.UTF-8"  
    $ hg clone https://code.google.com/p/growl/  
    $ cd growl  
    $ hg tags | sort  
    


The "hg tags | sort" command shows you all the versions of growl you can
build. Now update the source to what ever version you want. We are
building the latest version as of today, so run the following command.


    ::::bash  
    $ hg update "Growl.app 2.0.1"  
    


Now we are ready to do a build. The official notes misses out on telling
us how to do this build.  
Reading instructions from other sources I found that running the
following command inside the growl directory should do the trick..


    ::::bash  
    $ xcodebuild -project Growl.xcodeproj -target Growl.app -configuration Release  
    


Here I got my first failure


    ::::bash  
    $ xcodebuild -project Growl.xcodeproj -target Growl.app -configuration Release  
    === BUILD AGGREGATE TARGET VCS Data OF PROJECT Growl WITH CONFIGURATION Release ===  
    Check dependencies
    
    === BUILD NATIVE TARGET GrowlLauncher OF PROJECT Growl WITH CONFIGURATION Release ===  
    Check dependencies  
    Code Sign error: The identity '3rd Party Mac Developer Application: The
    Growl Project, LLC' doesn't match any valid, non-expired
    certificate/private key pair in your keychains
    
    ** BUILD FAILED **
    
    The following build commands failed:  
    Check dependencies  
    (1 failure)  
    


This is one of the failures the official document warned us about. A
Quick fix is to generate a self signed certificate with the prefix '3rd
Party Mac Developer Application: The Growl Project, LLC'.

#### Create Self Signed Certificate {#cert}

Open the Keychain Access.app, go to Keychain Access menu then go to
'Certificate Assistant' and finally click on 'Create a Certificate...'.
Fill out all details as shown in the screenshot below

[![Screen Shot 2013-03-08 at 6.38.30 PM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-08-at-6.38.30-PM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-08-at-6.38.30-PM.png)

Here are the details -  
Name: 3rd Party Mac Developer Application: The Growl Project, LLC  
Identity Type: Self Signed Root  
Certificate Type: Code Signing

Now click on create and click on continue button when it shows you the
"You are about to create a self-signed certificate" and finally click on
Done when you see the below screen.

[![Screen Shot 2013-03-08 at 6.39.12
PM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-08-at-6.39.12-PM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-08-at-6.39.12-PM.png)

Close the Keychain Access app and re-run the build command on the
terminal window.  
This time you should see a popup window like the one shown below saying
"codesign wants to sign using key '3rd Party Mac Developer Application:
The Growl Project, LLC' in your keychain". Looks promising... Click
Always Allow.

[![Screen Shot 2013-03-08 at 6.36.45
PM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-08-at-6.36.45-PM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-08-at-6.36.45-PM.png)

but this time the build failed with two new errors


    ::::bash  
    
    /Users/shireenrao/projects/growl/Plugins/Actions/Speech/GrowlSpeechDisplay.m:15:9:
    fatal error: 'ShortcutRecorder/ShortcutRecorder.h' file not found  
    #import <ShortcutRecorder/ShortcutRecorder.h>  
    ^  
    1 error generated.
    
    /Users/shireenrao/projects/growl/Plugins/Actions/Speech/GrowlSpeechPrefs.m:12:9:
    fatal error: 'ShortcutRecorder/ShortcutRecorder.h' file not found  
    #import <ShortcutRecorder/ShortcutRecorder.h>  
    ^  
    1 error generated.
    
    2013-03-10 15:19:13.982 xcodebuild[45006:7b03] DVTAssertions: Warning in
    /SourceCache/IDEXcode3ProjectSupport/IDEXcode3ProjectSupport-2108/Xcode3Sources/XcodeIDE/Frameworks/DevToolsBase/pbxcore/SpecificationTypes/XCGccMakefileDependencies.m:87  
    Details: Failed to load dependencies output contents from
    ``/Users/shireenrao/projects/growl/build/Growl.build/Release/Speech.build/Objects-normal/x86_64/GrowlSpeechPrefs.d''.
    Error: Error Domain=NSCocoaErrorDomain Code=260 "The file
    “GrowlSpeechPrefs.d” couldn’t be opened because there is no such file."
    UserInfo=0x402b75740
    {NSFilePath=/Users/shireenrao/projects/growl/build/Growl.build/Release/Speech.build/Objects-normal/x86_64/GrowlSpeechPrefs.d,
    NSUnderlyingError=0x402e22420 "The operation couldn’t be completed. No
    such file or directory"}. User info: {  
    NSFilePath =
    "/Users/shireenrao/projects/growl/build/Growl.build/Release/Speech.build/Objects-normal/x86_64/GrowlSpeechPrefs.d";  
    NSUnderlyingError = "Error Domain=NSPOSIXErrorDomain Code=2 \"The
    operation couldn\U2019t be completed. No such file or directory\"";  
    }.  
    Function: void
    XCGccMakefileDependenciesParsePathsFromRuleFile(NSString *, void
    (^)(NSString *))  
    Thread: {name = (null), num = 11}  
    Please file a bug at http://bugreport.apple.com with this warning
    message and any useful information you can provide.
    
    ** BUILD FAILED **
    
    The following build commands failed:  
    CompileC
    build/Growl.build/Release/Speech.build/Objects-normal/x86_64/GrowlSpeechDisplay.o
    Plugins/Actions/Speech/GrowlSpeechDisplay.m normal x86_64 objective-c
    com.apple.compilers.llvm.clang.1_0.compiler  
    CompileC
    build/Growl.build/Release/Speech.build/Objects-normal/x86_64/GrowlSpeechPrefs.o
    Plugins/Actions/Speech/GrowlSpeechPrefs.m normal x86_64 objective-c
    com.apple.compilers.llvm.clang.1_0.compiler  
    (2 failures)  
    


So at this point I started looking around the growl google group. I
found a couple of things. Firstly Growl 2.0.1 was built on Xcode 4.5.x.
I am trying to do this on 4.6. Secondly, the rake build tool is now
being used to build growl. Armed with that info this is what I tried
next


    ::::bash  
    $ cd Release  
    $ VERSION=2.0.1 rake setup  
    xcrun: error: unable to find utility "packagemaker", not a developer tool or in PATH  
    


Another error.. This time about a tool called packagemaker. After some
google foo, found out that packagemaker is no longer part of xcode. It
is now available in a separate package called Auxiliary tools for Xcode
Developer Preview. Get it from
[here](https://developer.apple.com/downloads/index.action).

[![Screen Shot 2013-03-08 at 4.05.28
PM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-08-at-4.05.28-PM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-08-at-4.05.28-PM.png)

Just copy PackageMaker to your Applications directory so it is available
on the command line. Once installed, try the build again.


    ::::bash  
    $ VERSION=2.0.1 rake setup  
    (in /Users/shireenrao/projects/growl/Release)  
    $ VERSION=2.0.1 rake build:growl  
    


Two new errors come up... -


    ::::bash  
    
    /Users/shireenrao/projects/growl/Plugins/Displays/GrowlDisplayWindowController.m:400:42:
    error: cast from function call of type 'void *' to non-matching type
    'NSInteger' (aka 'long') [-Werror,-Wbad-function-cast]  
    NSInteger startPercentage = (NSInteger) NSMapGet(startTimes,
    transition);  
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    
    /Users/shireenrao/projects/growl/Plugins/Displays/GrowlDisplayWindowController.m:401:42:
    error: cast from function call of type 'void *' to non-matching type
    'NSInteger' (aka 'long') [-Werror,-Wbad-function-cast]  
    NSInteger endPercentage = (NSInteger) NSMapGet(endTimes, transition);  
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    2 errors generated.  
    


<a name="code1"></a>

#### First Code Change

This is a casting error and I think mainly because I am trying to build
this using xcode 4.6. I opened the file
"growl/Plugins/Displays/GrowlDisplayWindowController.m" and removed the
cast "(NSInteger)" from the two lines right before NSMapGet. Tried
running the command "VERSION=2.0.1 rake build:growl" again and got a new
error


    ::::bash  
    
    /Users/shireenrao/projects/growl/Plugins/Actions/SMS/GrowlSMSDisplay.m:141:97:
    error: format specifies type 'unsigned int' but the argument has type
    'CFIndex' (aka 'long') [-Werror,-Wformat]  
    CFStringRef contentLength =
    CFStringCreateWithFormat(kCFAllocatorDefault, NULL, CFSTR("%u"),
    CFDataGetLength(postData));  
    ~~ ^~~~~~~~~~~~~~~~~~~~~~~~~  
    %lu  
    1 error generated.  
    


<a name="code2"></a>

#### Second Code Change

This was an easy fix as the fix is in the error shown above. I just
change %u to %lu in the file growl/Plugins/Actions/SMS/GrowlSMSDisplay.m
on the error line.

After retrying the build command once again, I finally saw this

** BUILD SUCCEEDED **

Yippeee!! The Growl.app is now available under
growl/Release/distribution/build/growl/Release/Growl.app

Just copy that to your applications folder and you have now built Growl
from Source :)

Ok, in all honesty, I am not sure if I am doing the right thing by
taking out the cast from the file
"growl/Plugins/Displays/GrowlDisplayWindowController.m". If I see any
problems with the app, I will revisit this problem.

I quickly wanted to mention another problem I encountered. A while back,
I had done a build using xcode. I don't remember what version of xcode I
had used and I was definitely using an older version of growl. Actually
I don't know which version I was using because I had not updated the
mercurial tag to say which version I should be using. As I said, I used
xcode to do the build. The build succeeded. I copied the build to my
applications and it was working for a while. I then started seeing the
message - "This Beta Has Expired / Please download a new version to keep
using Growl". I didn't know what happened for a while. Turns out, I did
not copy the app from the release configuration. I had copied Growl.app
from the debug configuration. Only the release configuration doesn't
have the beta flag in the code.

Now I know that to create a release build in xcode, you have to edit
your current scheme. You do that by hitting (⌘<) inside xcode and
highlight "Run [name of application]. On the right, select "Build
Configuration" and choose "Release". Click Ok to close the window. Here
is a screenshot of what you will change -

[![Screen Shot 2013-03-10 at 11.43.44
PM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-10-at-11.43.44-PM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-10-at-11.43.44-PM.png)

Build by hitting ⌘B in Xcode. If you have your self signed certificate
and have edited the two files as mentioned above, the build should
succeed. But, there is one slight problem... The version number in the
app is incorrect. It shows up as 2.0b6 instead of 2.0.1.

[![Screen Shot 2013-03-10 at 11.42.47
PM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-10-at-11.42.47-PM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-10-at-11.42.47-PM.png)

[![Screen Shot 2013-03-11 at 12.01.52
AM]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-11-at-12.01.52-AM.png)]({filename}/wp-content/uploads/2013/03/Screen-Shot-2013-03-11-at-12.01.52-AM.png)

That's why the rake build method is recommended.

Here is a quick synopsis of the entire build process without my hiccups  
<a name="instructions"></a>  
**Requirements**

-   OS X Mountain Lion - 10.8.2
-   Xcode - 4.6
-   Mercurial Client - I used the one from
    [here](http://mercurial.berkwood.com/)
-   Git Client
-   Packagemaker - look for Auxiliary tools
    [here](https://developer.apple.com/downloads/index.action)
-   Create self signed certificate as shown [here](#cert)

**Steps**


    ::::bash  
    $ hg clone https://code.google.com/p/growl/  
    $ cd growl  
    $ hg update "Growl.app 2.0.1"  
    


Edit files as shown [here](#code1) and [here](#code2)


    ::::bash  
    $ cd Release  
    $ export LC_ALL="en_US.UTF-8"  
    $ VERSION=2.0.1 rake setup  
    $ VERSION=2.0.1 rake build:growl  
    


Growl.app is available at
growl/Release/distribution/build/growl/Release/Growl.app
