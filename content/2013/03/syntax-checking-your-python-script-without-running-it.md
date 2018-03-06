Title: Syntax Checking your python script without running it
Date: 2013-03-01 11:20
Author: srini
Category: software
Tags: python
Slug: syntax-checking-your-python-script-without-running-it

This is a neat little trick to test your python code on the command line
without running the script.


    ::::bash  
    $ python -m py_compile yourpythonscript.py  

All that command does is compile your python script and create a .pyc
file. If there are any errors, you will see the errors be spit out.
