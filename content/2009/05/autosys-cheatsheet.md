Title: Autosys cheatsheet
Date: 2009-05-20 10:33
Author: srini
Category: software
Tags: autosys
Slug: autosys-cheatsheet

Here are some handy aliases to use with autosys...

    ::::bash
    # Send Event  
    alias -x se='sendevent -E'

    # Start Job  
    alias -x fsj='sendevent -E FORCE_STARTJOB -J'  
    alias -x sj='sendevent -E STARTJOB -J'

    # Job Report  
    ar='autorep -w -J '

    fsj='sendevent -E FORCE_STARTJOB -J'  
    hold='sendevent -E JOB_ON_HOLD -J '  
    ice='sendevent -E JOB_ON_ICE -J '

    jd='job_depends -c -w -J '  
    killjob='sendevent -E KILLJOB -J '  
    offhold='sendevent -E JOB_OFF_HOLD -J '  
    office='sendevent -E JOB_OFF_ICE -J '  
    se='sendevent -E'  
    sj='sendevent -E STARTJOB -J'  
    success='sendevent -E CHANGE_STATUS -s SUCCESS -J '  
    terminate='sendevent -E CHANGE_STATUS -s TERMINATED -J '

Display JIL (Job Instruction Language):  
autorep -w -J <jobname> -q

Load JIL:  
jil < JIL_source

Find unique commands currently being used:  
autorep -J PARTIALJOBNAME% -q | grep "command:" | awk -F: '{print $2}'|awk '{print $1}' | sort -u > /tmp/cmds.txt

Meaning of AutoSys status:  
STATUS AUTOSTATUS Meaning  
RU RUNNING Running  
ST STARTING Starting  
SU SUCCESS Success  
FA FAILURE Failure  
TE TERMINATED Terminated  
OI ON_ICE On Ice  
IN INACTIVE Inactive  
AC ACTIVATED Activated  
RE RESTART Restart  
OH ON_HOLD On Hold  
QW QUE_WAIT Queue Wait  
RD Refresh Dependencies  
RF Refresh Filewatcher

Forecast report from date to infinity:  
job_depends -t -J ALL -F "mm/dd/yyyy"

Display all jobs scheduled to run between these two dates:  
job_depends -t -J ALL -F:06/01/2008 -T:06/30/2008

check if the event procesor is up and running  
chk_auto_up

Display list of available timezones:  
autotimezone -l

Get version information:  
autoflags -a

View Remote Agent log:  
autosyslog -J jobname

AutoSys Unix xwindows GUI control panel  
autosc &

Check Database connections:  
autoping -m machinename -D

[Here](http://supportconnectw.ca.com/public/autosys/infodocs/autosys_cheatsheet.asp)
is a link to the official cheatsheet from [CA](http://www.ca.com/us/)
