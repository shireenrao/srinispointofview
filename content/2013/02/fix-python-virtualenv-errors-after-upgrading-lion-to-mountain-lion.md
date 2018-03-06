Title: Fix Python virtualenv errors after upgrading Lion to Mountain Lion
Date: 2013-02-21 07:00
Author: srini
Category: software
Tags: mac, python
Slug: fix-python-virtualenv-errors-after-upgrading-lion-to-mountain-lion

I upgraded the OS of my mac mini to Mountain Lion this weekend.
Unfortunately it messed up all my python settings. When I ssh'd into the
mac mini I saw an ugly python error. The gist of which was the
following -

“ImportError: No module named virtualenvwrapper.hook_loader”

Basically I just had to Install the Xcode Command Line tools, and that
would have fixed everything. Just in case, I also installed pip,
virtualenv and virtualenvwrapper again.

It's all good now :)
