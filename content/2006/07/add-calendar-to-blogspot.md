Title: Add Calendar to blogspot
Date: 2006-07-31 09:09
Author: srini
Category: software
Tags: food
Slug: add-calendar-to-blogspot

I wanted to add a calendar to my blog and knew I dont have to re-create
the wheel.. This is used mainly when you are in the archives section.  
This section goes between the head tags 

    ::::javascript
    <script type="text/javascript" language="JavaScript">

    /* you absolutely, positively must change the value for dateType below
    to match your  
    "Date Header Format" as set in your blog's Settings  
    if your date format is:  
    "Sunday, June 24, 2001" use 1  
    "6/24/2001" use 2  
    "6.24.2001" use 3  
    "20010624" use 4  
    "2001/06/24" use 5  
    "2001-06-24" use 6  
    "24.6.01" use 7  
    "June 24, 2001" use 8  
    "june 24, 2001" use 9  
    something else, change to one of those and use the right number! */

    dateType = "1";

    tableFontStyle = "10px Verdana";  
    tableBackgroundStyle = "#eee";  
    tableBackgroundLinkStyle = "#ffff99";  
    // tableBorderStyle is the CSS style applied to the outside of the
    table, and around each cell  
    tableBorderStyle = "1px solid black";  
    // tableBorder is the ugly old HTML border attribute  
    tableBorder = "0";

    /* change the lowMonthNames if you use a non-English language and you
    use one of the date styles  
    with the month name in the date, but be sure they are in lower case
    (these are used for  
    matching, not displaying */

    lowMonthNames = new Array("january", "february", "march", "april",
    "may", "june", "july", "august", "september", "october", "november",
    "december");

    // you can change the displayMonthNames and displayWeekdayNames to
    anything that suits you

    displayMonthNames = new Array("January", "February", "March", "April",
    "May", "June", "July", "August", "September", "October", "November",
    "December");  
    displayWeekdayNames = new Array("Su", "Mo", "Tu", "We", "Th", "Fr",
    "Sa");

    /* if you already do something with the body onload event (or want to
    later), add a call to  
    it in this function or put the "if (inArchives) drawCalendar();" call in
    your existing  
    onload function */  
    function doOnloadTasks(){  
    if (inArchives) drawCalendar();  
    }

    // time to stop changing things, unless you are sure you know what
    you're doing!  
    links = new Array();  
    inArchives = false;  
    if (location.href.indexOf("<$BlogArchiveFileName$>") > -1)
    inArchives = true;

    function datesplitter(date, datetype){  
    switch(datetype){  
    case "1" :  
    date = date.substring(date.indexOf(",")+2);  
    year = date.substring(date.length-4);  
    day = date.substring(date.indexOf(" ")+1,date.indexOf(","));  
    wordMonth = date.substring(0,date.indexOf(" "));  
    wordMonth = wordMonth.toLowerCase();  
    for (i = 0; i < 12; i++){  
    if (lowMonthNames[i] == wordMonth){  
    month = i;  
    i = 12;  
    }  
    }  
    break;  
    case "2" :  
    year = date.substring(date.length-4);  
    month = date.substring(0,date.indexOf("/"))-1;  
    day = date.substring(date.indexOf("/")+1,date.lastIndexOf("/"));  
    break;  
    case "3" :  
    year = date.substring(date.length-4);  
    month = date.substring(0,date.indexOf("."))-1;  
    day = date.substring(date.indexOf(".")+1,date.lastIndexOf("."));  
    break;  
    case "4" :  
    year = date.substring(0,4);  
    month = date.substring(4,6);  
    if (month.charAt(0) == "0") month = month.substring(1);  
    month = month-1;  
    day = date.substring(6);  
    if (day.charAt(0) == "0") day = day.substring(1);  
    break;  
    case "5" :  
    year = date.substring(0,4);  
    month = date.substring(date.indexOf("/")+1,date.lastIndexOf("/"));  
    if (month.charAt(0) == "0") month = month.substring(1);  
    month = month-1;  
    day = date.substring(date.lastIndexOf("/")+1);  
    if (day.charAt(0) == "0") day = day.substring(1);  
    break;  
    case "6" :  
    year = date.substring(0,4);  
    month = date.substring(date.indexOf("-")+1,date.lastIndexOf("-"));  
    if (month.charAt(0) == "0") month = month.substring(1);  
    month = month-1;  
    day = date.substring(date.lastIndexOf("-")+1);  
    if (day.charAt(0) == "0") day = day.substring(1);  
    break;  
    case "7" :  
    year = date.substring(date.length-2);  
    if (year.charAt(0) == "0") year = year.charAt(1);  
    year = parseInt(year);  
    if (year < 50) year = 2000 + year; else year = 1900 + year;  
    month = date.substring(date.indexOf(".")+1,date.lastIndexOf("."))-1;  
    day = date.substring(0,date.indexOf("."));  
    break;  
    case "8" :  
    year = date.substring(date.length-4);  
    day = date.substring(date.indexOf(" ")+1,date.indexOf(","));  
    wordMonth = date.substring(0,date.indexOf(" "));  
    wordMonth = wordMonth.toLowerCase();  
    for (i = 0; i < 12; i++){  
    if (lowMonthNames[i] == wordMonth){  
    month = i;  
    i = 12;  
    }  
    }  
    break;  
    case "9" :  
    year = date.substring(date.length-4);  
    day = date.substring(date.indexOf(" ")+1,date.indexOf(","));  
    wordMonth = date.substring(0,date.indexOf(" "));  
    for (i = 0; i < 12; i++){  
    if (lowMonthNames[i] == wordMonth){  
    month = i;  
    i = 12;  
    }  
    }  
    break;  
    default :  
    year = 1980;  
    month = 1;  
    day = 1;  
    }  
    oDate = new Date(year, month, day);  
    return oDate;  
    }

    function countDays(date){  
    // given a date object, return number of days in that month  
    monthcount = new Array ("31", "28", "31", "30", "31", "30", "31", "31",
    "30", "31", "30", "31");  
    year = date.getFullYear();  
    if (year % 4 == 0){  
    if (year % 100 == 0){  
    if (year % 400 == 0){  
    monthcount[1]++;  
    }  
    }  
    else {  
    monthcount[1]++;  
    }  
    }  
    return monthcount[date.getMonth()];  
    }

    function drawCalendar(){  
    // only executes in a DOM compliant browser  
    if (document.getElementById){  
    if (document.createElement){  
    // IE is just barely compliant, if you use a deprecated style of
    attribute setting  
    navigator.appVersion.indexOf("MSIE") > 0 ? isIE = true : isIE = false;  
    calStart = realDate;  
    calStart.setDate(1);  
    dayCount = countDays(calStart);  
    leadblanks = calStart.getDay();  
    oTable = document.createElement("TABLE");  
    oTBody = document.createElement("TBODY");  
    oRow = document.createElement("TR");  
    oCell = document.createElement("TD");  
    if (isIE)  
    oCell.colSpan="7";  
    else  
    oCell.setAttribute("colspan", "7");  
    oDateLabel =
    document.createTextNode(displayMonthNames[calStart.getMonth()] + " " +
    calStart.getFullYear());  
    oCell.appendChild(oDateLabel);  
    oRow.appendChild(oCell);  
    oTBody.appendChild(oRow);  
    oRow = document.createElement("TR");  
    for (i=0;i<7;i++){  
    oCell = document.createElement("TD");  
    oCell.style.border = tableBorderStyle;  
    oDay = document.createTextNode(displayWeekdayNames[i]);  
    oCell.appendChild(oDay);  
    oRow.appendChild(oCell);  
    }  
    oTBody.appendChild(oRow);  
    dayindex = 1;  
    while (dayindex <= dayCount){  
    oRow = document.createElement("TR");  
    for (i=0;i<leadblanks;i++){  
    oCell = document.createElement("TD");  
    oCell.style.border = tableBorderStyle;  
    if (isIE)  
    oSpace = document.createTextNode(" ");  
    else  
    {  
    oSpace = document.createTextNode("*");  
    oCell.style.color = tableBackgroundStyle;  
    }  
    oCell.appendChild(oSpace);  
    oRow.appendChild(oCell);  
    }  
    for (b=leadblanks;b<7;b++){  
    oCell = document.createElement("TD");  
    oCell.style.border = tableBorderStyle;  
    if (links[dayindex] != null){  
    oLink = document.createElement("A");  
    if (isIE)  
    oLink.href=links[dayindex];  
    else  
    oLink.setAttribute("href", links[dayindex]);  
    oLinkText = document.createTextNode(dayindex);  
    oLink.appendChild(oLinkText);  
    oCell.appendChild(oLink);  
    oCell.style.background = tableBackgroundLinkStyle;  
    }  
    else  
    if (dayindex <= dayCount){  
    oDayText = document.createTextNode(dayindex);  
    oCell.appendChild(oDayText);  
    }  
    else {  
    if (is

    IE)  
    oSpace = document.createTextNode(" ");  
    else  
    {  
    oSpace = document.createTextNode("*");  
    oCell.style.color = tableBackgroundStyle;  
    }  
    oCell.appendChild(oSpace);  
    }  
    oRow.appendChild(oCell);  
    oTBody.appendChild(oRow);  
    dayindex++;  
    }  
    leadblanks = 0;  
    }  
    oTBody.style.font = tableFontStyle;  
    oTBody.style.textAlign = "center";  
    oTable.appendChild(oTBody);  
    if (isIE)  
    oTable.style.background = tableBackgroundStyle;  
    else  
    oTable.setAttribute("bgColor", tableBackgroundStyle);  
    oTable.border = tableBorder;  
    oTable.style.border = tableBorderStyle;  
    calendarSpot = document.getElementById("CalendarHere");  
    calendarSpot.appendChild(oTable);  
    }  
    }  
    }  
    </script>  

This goes in your body tag

    ::::html
    <body onload="doOnloadTasks()">

This goes where you want the calendar to appear

    ::::html
    <span id="CalendarHere"><!-- tells the script where to put the calendar -->

This replaces your BlogDateHeader section

    ::::html
    <BlogDateHeader>
      <script type="text/javascript">
      var postDate="<$BlogDateHeaderDate$>";
      realDate = datesplitter(postDate,dateType);
      anchorDate = realDate.valueOf();
      links[realDate.getDate()] = "#d" + anchorDate;
      document.write("<a name='d" + anchorDate + "'></a>");
      </script>
      <$BlogDateHeaderDate$>
    </BlogDateHeader>


