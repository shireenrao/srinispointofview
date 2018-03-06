Title: Xcode cache causing problems
Date: 2013-04-10 13:35
Author: srini
Category: software
Slug: xcode-cache-causing-problems

The keyboard sequence Command-Option-Shift-K is used to clean out the
build folder. Even better, quit Xcode and clean out
~/Library/Developer/Xcode/DerivedData manually. Remove all its contents
because there's a bug where Xcode will run an old version of your
project that's in there somewhere. (Xcode 4.2 will show you the Derived
Data folder: choose Window > Organizer and switch to the Projects tab.
Click the right-arrow to the right of the Derived Data folder name.)
