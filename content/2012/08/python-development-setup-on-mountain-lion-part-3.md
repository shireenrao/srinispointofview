Title: Python development setup on Mountain Lion - part 3
Date: 2012-08-29 09:17
Author: srini
Category: software
Tags: mac, python
Slug: python-development-setup-on-mountain-lion-part-3

#### Eclipse setup to use python in a virtualenv

Today I will cover how to setup eclipse to use the python virtual
environment we created in [part
2]({filename}/2012/08/python-development-setup-on-mountain-lion-part-2.md) of this
series.

When you first launch eclipse, create a new workspace and call it
something relevant. I called it python273 and created it in a folder
called workspaces under my home directory.

Now go ahead and install the pydev module. You can do this by going to
the eclipse marketplace. Click on Help->Eclipse Marketplace... Type
pydev in the find textbox and click on Go. Click on the Install button
when you see the pydev module. Go through the installation and restart
eclipse.

Once eclipse comes back, open the preferences pane and expand pydev and
select the Interpreter - Python option. Click on the New button on that
screen and fill out the interpreter name and select the path to python
in your virtualenv (/Users/username/.virtualenvs/python273/bin/python)

[![PyDev Python Settings]({static}/wp-content/uploads/2012/08/Screen-Shot-2012-08-28-at-10.30.26-PM-300x237.png "Pydev Python settings")]({static}/wp-content/uploads/2012/08/Screen-Shot-2012-08-28-at-10.30.26-PM.png)

Click on OK. Now you will be greeted with a dialogue box of all modules
eclipse found. Select all the modules you want to add to eclipses
pythonpath. I will just let the default be. just make sure you are only
using paths which are in your virtualenv. Click OK. You should now see
the following dialogue box

[![Virtualenv Warning]({static}/wp-content/uploads/2012/08/Screen-Shot-2012-08-28-at-10.40.18-PM-300x201.png "Virtualenv warning")]({static}/wp-content/uploads/2012/08/Screen-Shot-2012-08-28-at-10.40.18-PM.png)

Just click on Proceed anyways. Then click on OK on the preferences page.
 Now lets switch to pydev mode in eclipse and test our Install.

Create a new PyDev Project (just select the defaults) and then create a
new module. Just write some print statements, save and then setup some
debug points and start debugging the code. You should now be able to
switch to debug mode and step through code.

In the next part I will walk through setting up git on your laptop and
integrate github into your workflow.
