Title: Send Email In Python Bugfix
Date: 2018-02-22 11:20
Author: srini
Category: software
Tags: python, email
Slug: send-email-in-python-bugfix

I have been using this python function for a while to send html emails from within my python scripts - 

    ::::python
    def sendhtmlemail(emailbody, subject):
        """ Send html email with given subject and body """
        fromaddr = readconfig(EMAIL_FROM)
        toaddr = readconfig(EMAIL_TO)
         
        msg = MIMEMultipart('alternative')
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = subject
         
        body = MIMEText(emailbody, 'html')
     
        msg.attach(body)
        
        
        s = smtplib.SMTP('localhost')
        s.sendmail(fromaddr, toaddr, msg.as_string())
        s.quit()
     
The emailbody is my html body I want in my email which may also include css in it. the variable EMAIL_FROM and 
EMAIL_TO are global variables which stored the file path where I could have the from email address and to email address.
If I want to send a plain text email, I use the following function - 

    ::::python
    def sendmail(subject, body):
        """ Send email with given subject and body """
        fromaddr = readconfig(EMAIL_FROM)
        toaddr = readconfig(EMAIL_TO)
        
        msg = MIMEMultipart()
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = subject
        msg.attach(MIMEText(body, 'plain'))
        
        s = smtplib.SMTP('localhost')
        s.sendmail(fromaddr, toaddr, msg.as_string())
        s.quit()
        
 
 I was recently using the sendhtmlemail function to send an email to multiple addresses. All I did was store the multiple 
 emails as a comma separated string in the EMAIL_TO file and found out that it was not being send to all the recipients. 
 It was only sent to the first recipient and the person who got it could see all the other people the email was sent to.. 
 Strange!
 
 After poking around and reading the official docs, I found out that the second parameter in the smtplib.SMTP's 
 sendmail function takes a list of RFC 822 to-address strings (a bare string will be treated as a list with 1 address). 
 DOH!
 
 I fixed this by splitting the toaddr variable on the comma and storing it in a new list and feed the list to the sendmail
 function! Here is my final plain text sendmail version - 
 
    ::::python
    def sendmail(subject, body):
        """ Send email with given subject and body """
        fromaddr = readconfig(EMAIL_FROM)
        toaddr = readconfig(EMAIL_TO)
        
        msg = MIMEMultipart()
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = subject
        msg.attach(MIMEText(body, 'plain'))
        toaddr_list = [x.strip() for x in toaddr.split(',')]
        
        s = smtplib.SMTP('localhost')
        s.sendmail(fromaddr, toaddr_list, msg.as_string())
        s.quit()
 
 
