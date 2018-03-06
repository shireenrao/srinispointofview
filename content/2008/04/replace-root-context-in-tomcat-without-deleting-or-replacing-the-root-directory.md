Title: Replace ROOT context in tomcat without deleting or replacing the ROOT directory
Date: 2008-04-04 05:43
Author: srini
Category: software
Tags: Java, tomcat
Slug: replace-root-context-in-tomcat-without-deleting-or-replacing-the-root-directory

This is a neat trick. At least it works in tomcat-4.1.24.

The first part to this trick is to know you can deploy a war file to the
webapps in tomcat without adding the context in the server.xml of your
tomcat installation. Suppose the name of your war file is
HelloWorld.war, create an xml file called HelloWorld.xml and add the
context snippet you would have added to the server.xml file to
HelloWorld.xml. Now deploy both HelloWorld.war and HelloWorld.xml to the
webapps folder. Voila! Your web application should now work.

The second part is to make your webapplication be the ROOT context. The
ROOT context by default is the Tomcat welcome page. One way of doing
this would be to just delete everything under ROOT and deploy your
application in there. Well there is another way... In your Context file,
just leave the path empty. Here is an example of the contents of the
context file for HelloWorld.war without any resources:

    ::::xml
    <context path="" docbase="HelloWorld.war" debug="0" reloadable="true" crosscontext="true" />

That should do it.. Just bring up Tomcat and enter your url in your
favourite browser.

