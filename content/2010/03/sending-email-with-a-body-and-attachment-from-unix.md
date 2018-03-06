Title: Sending email with a body and attachment from UNIX
Date: 2010-03-03 03:40
Author: srini
Category: software
Tags: unix
Slug: sending-email-with-a-body-and-attachment-from-unix

It is easy to send a text file as the body of an email from UNIX. You
can do it using the command below 

    ::::bash  
    mail -s "Email with file as body" email@domain.com < message.txt  


Now if you want to send a file as an attachment, you would need to use
uuencode piped to mail. This file can be a binary file or a text file.
The command is  

    ::::bash  
    uuencode file.dat file.dat | mail -s "Email with attachment" email@domain.com  


Suppose you want to send an email with a body and an attachement. Here
is the trick -

First create the attachment file by using uuencode. Then join the
message file which is the body of the email along with the uuencoded
file which is going to be an attachment by using the cat command.  

    ::::bash  
    uuencode file.dat file.dat > attachment.txt  
    cat message.txt attachment.txt > combined.txt  
      

Now all you need do is to send the email using the first method shown
here  

    ::::bash  
    mail -s "Email with message body and attachment" email@domain.com < combined.txt  
    


*** Updated Feb 22, 2013  
Here is a script I wrote a while ago using the same concepts as
above... I call it mailfile.ksh


    ::::bash  
    #! /usr/bin/ksh
    
    A_FLAG=FALSE
    
    while getopts :a OPTION  
    do  
        case ${OPTION} in  
        # -a as attachment  
            a) shift;A_FLAG=TRUE;;  
            \?) print -u2 "Usage: ${PROG_NAME} [-a] EMAIL MAILFILE SUBJECT"  
                exit 2;;  
        esac  
    done
    
    EMAIL=$1  
    # shift param one position  
    shift  
    MAILFILE=$1  
    # shift param one position  
    shift  
    # copy rest of params to SUBJECT  
    SUBJECT=$*  
    # get rid of quotes  
    SUBJECT=$(echo $SUBJECT| sed 's/"//g')
    
    if [ $A_FLAG = TRUE ]  
    then  
        ATTACHEDFILE=`basename $MAILFILE`  
        /usr/bin/uuencode $MAILFILE $ATTACHEDFILE > /tmp/$ATTACHEDFILE$$  
        MAILFILE=/tmp/$ATTACHEDFILE$$  
    fi
    
    /usr/ucb/mail -s"$SUBJECT" $EMAIL < $MAILFILE
    
    # Cleanup  
    if [ $A_FLAG = TRUE ]  
    then  
        rm /tmp/$ATTACHEDFILE$$  
    fi  


The usage is the following if you want to attach a file as an
attachment  

    ::::bash  
    $ mailfile.ksh -a email@example.com yourfile.gz Your Subject  
      

And if you want the file as the body, the usage is -  

    ::::bash  
    $ mailfile.ksh email@example.com SomeFile.csv Your Subject  
    

