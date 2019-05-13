Title: Disqus comments not loading
Date: 2019-05-13 8:30
Author: srini
Category: software
Tags: pelican, disqus
Slug: disqus-comments-not-loading


I am a little upset that my disqus comments widget is not loading on my previous post from last week.
It is loading fine on all the older posts but not on the last one. Posting a random rant just to see
if it is an issue with that post or everthing going forward. I hope it is a onetime glitch. I have a feeling
it maybe got to do with me changing the slug on that article. Will find out shortly.

Update - after a bunch of trials, found the issue with how my SITEURL on my pelican config was causing this.
If I have RELATIVE_URLS set to true, SITEURL becomes relative too. So places where I need the SITEURL be the absolute URL, like for instance in my disqus generated section for each article.. it was breaking that articles disqus widget. 

This <a href="https://github.com/getpelican/pelican/issues/1710">article</a> gave me a solution on how to fix this. I defined a new variable called SITEURL_ABS = SITEURL in publishconf.py and changed the template where disqus widget was getting generated and use the SITEURL_ABS variable instead of SITEURL. This needs to be done as SITEURL gets changed if RELATIVE_URLS is set to True.