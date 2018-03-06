Title: How to update individual packages in the enthought Python Distribution
Date: 2013-08-20 16:28
Author: srini
Category: software
Tags: enthought, epd, python
Slug: how-to-update-individual-packages-in-the-enthought-python-distribution

I am recently came across a youtube video about data analysis using
Python by Wes McKinney. So to learn a new library I thought I would
follow the tutorial. As I already had Enthought Python distribution
installed on my macbook, I thought I had all the prerequisites. Sadly
that was not the case. I had to update some of the packages. Luckily epd
comes with its own package manager called enpkg. This is what I did to
update python, numpy and pandas -


    ::::bash  
    $ sudo enpkg enstaller  
    Password:  
    prefix: /Library/Frameworks/Python.framework/Versions/7.3  
    enstaller-4.6.2-1.egg [fetching]  
    267 KB
    [.................................................................]  
    enstaller-4.5.3-1.egg [removing]  
    607 KB
    [.................................................................]  
    enstaller-4.6.2-1.egg [installing]  
    765 KB
    [.................................................................]  
    $ sudo enpkg ipython  
    prefix: /Library/Frameworks/Python.framework/Versions/7.3  
    ipython-0.13.1-2.egg [fetching]  
    2.55 MB
    [.................................................................]  
    ipython-0.12.1-3.egg [removing]  
    7.31 MB
    [.................................................................]  
    ipython-0.13.1-2.egg [installing]  
    7.42 MB
    [.................................................................]  
    $ sudo enpkg pandas  
    prefix: /Library/Frameworks/Python.framework/Versions/7.3  
    MKL-10.3-1.egg [fetching]  
    34.74 MB
    [.................................................................]  
    numpy-1.7.1-2.egg [fetching]  
    3.31 MB
    [.................................................................]  
    pandas-0.12.0-1.egg [fetching]  
    3.97 MB
    [.................................................................]  
    numpy-1.6.1-0.egg [removing]  
    10.97 MB
    [.................................................................]  
    MKL-10.3-1.egg [installing]  
    106.08 MB
    [.................................................................]  
    numpy-1.7.1-2.egg [installing]  
    11.58 MB
    [.................................................................]  
    pandas-0.12.0-1.egg [installing]  
    14.50 MB
    [.................................................................]  

