Title: Reuse previous arguments
Date: 2008-06-20 06:08
Author: srini
Category: software
Tags: linux, tips, unix
Slug: reuse-previous-arguments

Here is another great tip from IBM. I love this. The !$ command returns
the last argument used with a command. But what happens if you have a
command that used arguments and you want to reuse just one of them?  

The !:1 operator returns the argument used in a command. The example in
Listing 3 shows how you can use this operator in combination with the
!$ operator. In the first command, a file is renamed to a more
meaningful name, but to preserve use of the original file name, a
symbolic link is created. The file kxp12.c is renamed in a more readable
manner, then the link command is used to create a symbolic link back to
the original file name, in case it's still used elsewhere. The !$
operator returns the file_system_access.c argument, and the !:1
operator returns the kxp12.c argument, which is the first argument of
the previous command.

    ::::bash
    $ mv kxp12.c file_system_access.c  
    $ ln –s !$ !:1


