Title: xampp problem due to missing lang.tmp
Date: 2010-02-25 17:34
Author: srini
Category: software
Tags: php
Slug: xampp-problem-due-to-missing-lang-tmp

I was trying to open the xampp home page today on my dev box and I got
the following error -

    ::::dos
    Warning:
    file_get_contents(lang.tmp)
    [[function.file-get-contents](http://localhost/xampp/function.file-get-contents)]:
    failed to open stream: No such file or directory in
    C:\xampp\htdocs\xampp\index.php on line *2*

I initially thought I had corrupted my install, but just for the heck of
it, I thought I would google the error and see if anybody had a similar
error. Good thing I tried... I would have wasted a lot of time,
reinstalling and enabling eclipse debugging with xampp. I remember I had
to go through hoops to get that to work. I will post an article soon on
how I did it.

Well the reason my xampp home page stopped working was because the
lang.tmp file got deleted somehow. Use the link
"<http://localhost/xampp/lang.php?en>" to recreate this file. You should
have a working xampp home page again.
