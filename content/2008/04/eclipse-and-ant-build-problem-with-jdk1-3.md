Title: Eclipse and ANT build problem with jdk1.3
Date: 2008-04-04 10:45
Author: srini
Category: software
Tags: ant, eclipse, Java
Slug: eclipse-and-ant-build-problem-with-jdk1-3

You can't do an ANT build inside eclipse if your chosen jdk is 1.3. Here
is a the error message you get...

    ::::java
    BUILD FAILED
    java.lang.NoClassDefFoundError: org/xml/sax/SAXException
    at org.apache.tools.ant.ProjectHelper.getProjectHelper(ProjectHelper.java:228)
    at org.eclipse.ant.internal.ui.antsupport.InternalAntRunner.parseBuildFile(InternalAntRunner.java:189)
    at org.eclipse.ant.internal.ui.antsupport.InternalAntRunner.run(InternalAntRunner.java:400)
    at org.eclipse.ant.internal.ui.antsupport.InternalAntRunner.main(InternalAntRunner.java:137)


nice little trick to fix that...  

Inside Eclipse Go to Window->Preferences...->Ant->Runtime

In the classpath tab, add a new entry to the Ant Home Entries to the
xerces jar file inside your eclipse/pluggins folder. In my case the file
was org.apache.xerces_2.8.0.v200705301630.jar.

Now go ahead an run your build again successfully :)

update: When I updated my eclipse to 3.4, this again stopped working for
me. The above fix did not work.I then saw a mailing list where the user
executed the ant script by right clicking the ant script and choosing
Run-\>Ant build..

Now change the JRE it runs in. It should be set to the option which says
"Run in the same JRE as the workspace"

The mailing list thread is
[here](http://dev.eclipse.org/newslists/news.eclipse.tools.jdt/msg09555.html)  
