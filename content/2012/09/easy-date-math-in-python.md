Title: Easy Date Math in Python
Date: 2012-09-16 13:08
Author: srini
Category: software
Slug: easy-date-math-in-python

I was trying to figure out exactly when does 6 months end from a given
date. Well one can just count the days and find out but I thought python
would be a good way to do it quickly. Here is one way to do it...


    ::::python  
    >>> from datetime import date  
    >>> from dateutil.relativedelta import relativedelta  
    >>> date(2012,12,14)+relativedelta(months=+6)  
    datetime.date(2013, 6, 14)  
    

