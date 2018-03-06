Title: Unix Aliases with variables in bash
Date: 2013-04-05 13:23
Author: srini
Category: software
Tags: bash, csh
Slug: unix-aliases-with-variables-in-bash

A lot of times you are typing the same command again and again on the
unix command line. Unix Aliases help to save time from typing out these
long commands. Back when I was using C Shell, I could use parameters in
aliases. For example I have this in my .cshrc file to find certain
running processes-  

    ::::bash  
    alias chk "ps auxwww | grep \!:1"  


running this would show me all commands which have java in them  

    ::::bash  
    $ chk java  


Unfortunately this alias does not work in Bash. The work around is to
create a function for that, rather than an alias, and then exported it,
like this:

    ::::bash  
    function chk { ps auxwww | grep "$1"; }  
    export -f chk  


Note -f switch to export: it tells it that you are exporting a function.
Put this in your .bashrc and you are good to go
