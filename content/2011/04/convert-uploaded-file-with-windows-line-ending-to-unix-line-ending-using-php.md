Title: Convert uploaded file with windows line ending to unix line ending using php
Date: 2011-04-01 11:56
Author: srini
Category: software
Tags: php, tips
Slug: convert-uploaded-file-with-windows-line-ending-to-unix-line-ending-using-php

I was working on a php project which involved in uploading a tab
delimited file and then processing it with php on a unix webserver to
insert data into a database. The file was produced on a windows machine
and so it had windows line endings. I used this trick to strip off the
carriage return and line feed characters from each line of the file  
  
Here is my html form code  

    ::::html  
    <form action="process.php" method="post" enctype="multipart/form-data" name="import_form">  
    <input type="hidden" name="action" value="import">  
    <input type="file" name="import_file">  
    <br>  
    <input type="button" value="Import">  
    </form>  


Here is my code for process.php  

    ::::php  
    if(isset($_POST['action']) && ($_POST['action'] == 'import')) {  
        if (is_uploaded_file($_FILES['import_file']['tmp_name'])) {
        
            // Move the file into an accessible location.  
            $buffer =
            trim(implode("",file($_FILES['import_file']['tmp_name'])));
            
            // Convert all line-endings to UNIX format  
            $buffer = str_replace("\r\n", "\n", $buffer);  
            $buffer = str_replace("\r", "\n", $buffer);
            
            //code for processing $buffer
        
        else {  
            echo "<p class=\"Error\">File Upload Failed.</p>";  
        }  
    }  
    

