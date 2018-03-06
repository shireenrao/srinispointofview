Title: How to go from Oracle to CSV
Date: 2010-03-04 02:37
Author: srini
Category: software
Tags: oracle
Slug: how-to-go-from-oracle-to-csv

Here is a trick to to create a comma delimited file from oracle. You can
create a csv file simply using SQL*Plus with any sql statement. Here it
is -  

    ::::sql
    set feedback off  
    set heading off  
    set underline off  
    set colsep ','  
    spool /path/to/file/mysheet.csv  
    select * from table  
    spool off  
      

Here are some other ways I found online  

<http://kpanchan.blogspot.com/2007/05/extract-csv-file-format-in-oracle-sql.html>  

[http://www.oracle-base.com/articles/9i/GeneratingCSVFiles.php](http://www.oracle-base.com/articles/9i/GeneratingCSVFiles.php)  

<http://asktom.oracle.com/pls/asktom/f?p=100:11:0::::P11_QUESTION_ID:68212348056>
