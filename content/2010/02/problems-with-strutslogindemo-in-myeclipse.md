Title: Problems with StrutsLoginDemo in myeclipse
Date: 2010-02-04 09:01
Author: srini
Category: software
Tags: eclipse, Java, struts
Slug: problems-with-strutslogindemo-in-myeclipse

Its been a while since I had done a struts project, so I thought I
would re-acclimate myself by doing the myeclipse StrutsLoginDemo. I
needed to do this with Struts 1.1 so I used the quick tutorial available
[here](http://www.myeclipseide.com/documentation/quickstarts/struts/#building).
The tutorial is a good one and finished it quickly.. the problem came
when I tried deploying it to tomcat. Before I get ahead of myself, here
are the versions of the different components I am using

Java: jdk1.3  
myeclipse: 5.0  
tomcat: 4.1.24  
struts: 1.1

Once I deployed this app and tried to test, I saw the following error -  

    ::::java
    org.apache.jasper.JasperException: This
    absolute uri (<a
    href="http://jakarta.apache.org/struts/tags-bean">http://jakarta.apache.org/struts/tags-bean</a>)  
    cannot be resolved in either web.xml or the jar files deployed with
    this application  
    at org.apache.jasper.compiler.DefaultErrorHandler.jspError(DefaultErrorHandler.java:105)  
    at org.apache.jasper.compiler.ErrorDispatcher.dispatch(ErrorDispatcher.java:430)  
    at org.apache.jasper.compiler.ErrorDispatcher.jspError(ErrorDispatcher.java:154)  
    at org.apache.jasper.compiler.TagLibraryInfoImpl.(TagLibraryInfoImpl.java:159)  
    at org.apache.jasper.compiler.Parser.parseTaglibDirective(Parser.java:354)  
    at org.apache.jasper.compiler.Parser.parseDirective(Parser.java:381)  
    at org.apache.jasper.compiler.Parser.parseElements(Parser.java:795)  
    at org.apache.jasper.compiler.Parser.parse(Parser.java:122)  
    at org.apache.jasper.compiler.ParserController.parse(ParserController.java:199)  
    at org.apache.jasper.compiler.ParserController.parse(ParserController.java:153)  
    at org.apache.jasper.compiler.Compiler.generateJava(Compiler.java:227)  
    at org.apache.jasper.compiler.Compiler.compile(Compiler.java:369)  
    at org.apache.jasper.JspCompilationContext.compile(JspCompilationContext.java:473)  
    at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:190)  
    at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:295)  
    at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:241)  
    at javax.servlet.http.HttpServlet.service(HttpServlet.java:853)  
    at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:247)  
    at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:193)  
    at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:256)  
    at org.apache.catalina.core.StandardPipeline$StandardPipelineValveContext.invokeNext(StandardPipeline.java:643)  
    at org.apache.catalina.core.StandardPipeline.invoke(StandardPipeline.java:480)  
    at org.apache.catalina.core.ContainerBase.invoke(ContainerBase.java:995)  
    at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)  
    at org.apache.catalina.core.StandardPipeline$StandardPipelineValveContext.invokeNext(StandardPipeline.java:643)  
    at org.apache.catalina.core.StandardPipeline.invoke(StandardPipeline.java:480)  
    at org.apache.catalina.core.ContainerBase.invoke(ContainerBase.java:995)  
    at org.apache.catalina.core.StandardContext.invoke(StandardContext.java:2415)  
    at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:180)  
    at org.apache.catalina.core.StandardPipeline$StandardPipelineValveContext.invokeNext(StandardPipeline.java:643)  
    at org.apache.catalina.valves.ErrorDispatcherValve.invoke(ErrorDispatcherValve.java:171)  
    at org.apache.catalina.core.StandardPipeline$StandardPipelineValveContext.invokeNext(StandardPipeline.java:641)  
    at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:172)  
    at org.apache.catalina.core.StandardPipeline$StandardPipelineValveContext.invokeNext(StandardPipeline.java:641)  
    at org.apache.catalina.core.StandardPipeline.invoke(StandardPipeline.java:480)  
    at org.apache.catalina.core.ContainerBase.invoke(ContainerBase.java:995)  
    at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:174)  
    at org.apache.catalina.core.StandardPipeline$StandardPipelineValveContext.invokeNext(StandardPipeline.java:643)  
    at org.apache.catalina.core.StandardPipeline.invoke(StandardPipeline.java:480)  
    at org.apache.catalina.core.ContainerBase.invoke(ContainerBase.java:995)  
    at org.apache.coyote.tomcat4.CoyoteAdapter.service(CoyoteAdapter.java:223)  
    at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:594)  
    at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.processConnection(Http11Protocol.java:392)  
    at org.apache.tomcat.util.net.TcpWorkerThread.runIt(PoolTcpEndpoint.java:565)  
    at org.apache.tomcat.util.threads.ThreadPool$ControlRunnable.run(ThreadPool.java:619)  
    at java.lang.Thread.run(Thread.java:479)

After some googling I saw that a lot of people had the same problem and none of the  
solutions I found helped me in any way. The error message made me look
at the web.xml and  
I found out why I was getting the error message. The problem is with
the way MyEclipse  
generates the headers for web.xml file. Here is what it generates for
the tutorial -  

    ::::xml  
    <?xml version="1.0" encoding="UTF-8"?>  
    <web-app xmlns="http://java.sun.com/xml/ns/j2ee"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.4"
    xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee
    http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">  
    <servlet>  
    <servlet-name>action</servlet-name>  
    
    <servlet-class>org.apache.struts.action.ActionServlet</servlet-class>  
    <init-param>  
    <param-name>config</param-name>  
    <param-value>/WEB-INF/struts-config.xml</param-value>  
    </init-param>  
    <init-param>  
    <param-name>debug</param-name>  
    <param-value>3</param-value>  
    </init-param>  
    <init-param>  
    <param-name>detail</param-name>  
    <param-value>3</param-value>  
    </init-param>  
    <load-on-startup>0</load-on-startup>  
    </servlet>  
    <servlet-mapping>  
    <servlet-name>action</servlet-name>  
    <url-pattern>*.do</url-pattern>  
    </servlet-mapping>  
    </web-app>  
      

You can fix this error by changing the header to be -  

    ::::xml  
    <?xml version="1.0" encoding="UTF-8"?>  
    <!DOCTYPE web-app PUBLIC "-//Sun Microsystems, Inc.//DTD Web
    Application 2.3//EN" "http://java.sun.com/dtd/web-app_2_3.dtd">  
    <web-app>  
    <servlet>  
    <servlet-name>action</servlet-name>  
    
    <servlet-class>org.apache.struts.action.ActionServlet</servlet-class>  
    <init-param>  
    <param-name>config</param-name>  
    <param-value>/WEB-INF/struts-config.xml</param-value>  
    </init-param>  
    <init-param>  
    <param-name>debug</param-name>  
    <param-value>3</param-value>  
    </init-param>  
    <init-param>  
    <param-name>detail</param-name>  
    <param-value>3</param-value>  
    </init-param>  
    <load-on-startup>0</load-on-startup>  
    </servlet>  
    <servlet-mapping>  
    <servlet-name>action</servlet-name>  
    <url-pattern>*.do</url-pattern>  
    </servlet-mapping>  
    </web-app>  
    

