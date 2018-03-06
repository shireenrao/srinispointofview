Title: How to install MongoDB on a Mac
Date: 02/02/2016
Author: srini
Category: software
Tags: mongodb, mac
Slug: how-to-install-mongodb-on-a-mac

I am starting to teach myself the MEAN stack. The MEAN stack
makes use of MongoDB, Express.js, Angular.js and Node.js. The best
part about this stack is that all parts of the stack can be written
in Javascript. Read this <a href="https://en.wikipedia.org/wiki/MEAN_(software_bundle)">wikipedia</a> article to know more.

The best way to install mongodb is using homebrew. First make sure homebrew is upto date and there are no issues

	::::bash
	$ brew update
	$ brew doctor

Then install mongodb - 

	::::bash
	$ brew install mongodb

Once mongodb is installed, create a data directory where mongodb will create all its database files - 

	::::bash
	$ sudo mkdir -p /data/db

Now change ownership to your account so you dont have to use sudo to run mongodb-
	
	::::bash
	$ sudo chown `id -u` /data/db

Thats it! Now run the 'mongod' command to run your instance of mongodb without using sudo.
 
