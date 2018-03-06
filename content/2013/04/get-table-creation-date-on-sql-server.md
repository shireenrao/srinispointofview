Title: Get Table creation date on SQL Server
Date: 2013-04-02 10:49
Author: srini
Category: software
Tags: sqlserver
Slug: get-table-creation-date-on-sql-server

I was trying to find some changes I had made to some tables and was
having a hard time finding the table I modified.. This helped me find
the ones I was last working on ;)

For SQL Server 2005 and up, you can use  

    ::::sql  
    SELECT  
    [name]  
    ,create_date  
    ,modify_date  
    FROM  
    sys.tables  
    

