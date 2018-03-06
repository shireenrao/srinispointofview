Title: Unix tar tricks
Date: 2010-08-31 10:10
Author: srini
Category: software
Tags: unix
Slug: unix-tar-tricks

One of the most common programs on Linux systems for packaging files is
the venerable tar. tar is short for tape archive, and originally, it
would archive your files to a tape device. Now, you're more likely to
use a file to make your archive. To use a tarfile, use the command-line
option -f . To create a new tarfile, use the command-line option -c. To
extract files from a tarfile, use the option -x. You also can compress
the resulting tarfile via two methods. To use bzip2, use the -j option,
or for gzip, use the -z option.

Instead of using a tarfile, you can output your tarfile to stdout or
input your tarfile from stdin by using a hyphen (-). With these options,
you can tar up a directory and all of its subdirectories by using:

    ::::bash  
    tar cf archive.tar dir  

Then, extract it in another directory with:  

    ::::bash  
    tar xf archive.tar  

When creating a tarfile, you can assign a volume name with the
option -V . You can move an entire directory structure with tar by
executing:  

    ::::bash  
    tar cf - dir1 | (cd dir2; tar xf -)  

You can go even farther and move an entire directory structure over the
network by executing:  

    ::::bash  
    tar cf - dir1 | ssh remote\_host "( cd /path/to/dir2; tar xf - )"  

GNU tar includes an option that lets you skip the cd part, -C
/path/to/dest. You also can interact with tarfiles over the network by
including a host part to the tarfile name. For example:  

    ::::bash  
    tar cvf username@remotehost:/path/to/dest/archive.tar dir1  

This is done by using rsh as the communication mechanism. If you want
to use something else, like ssh, use the command-line
option --rsh-command CMD. Sometimes, you also may need to give the path
to the rmt executable on the remote host. On some hosts, it won't be in
the default location /usr/sbin/rmt. So, all together, this would look
like:  

    ::::bash  
    tar -c -v --rsh-command ssh --rmt-command /sbin/rmt -f username@host:/path/to/dest/archive.tar dir1  
      

Although tar originally used to write its archive to a tape drive, it
can be used to write to any device. For example, if you want to get a
dump of your current filesystem to a secondary hard drive, use:  

    ::::bash  
    tar -cvzf /dev/hdd /  

Of course, you need to run the above command as root. If you are
writing your tarfile to a device that is too small, you can tell tar to
do a multivolume archive with the -M option. For those of you who are
old enough to remember floppy disks, you can back up your home directory
to a series of floppy disks by executing:  

    ::::bash  
    tar -cvMf /dev/fd0 \$HOME  

If you are doing backups, you may want to preserve the file
permissions. You can do this with the -p option. If you have symlinked
files on your filesystem, you can dereference the symlinks with the -h
option. This tells tar actually to dump the file that the symlink points
to, not just the symlink.

Along the same lines, if you have several filesystems mounted, you can
tell tar to stick to only one filesystem with the option -l. Hopefully,
this gives you lots of ideas for ways to archive your files.

Source - <http://www.linuxjournal.com/content/stupid-tar-tricks>
