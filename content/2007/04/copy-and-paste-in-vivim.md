Title: Copy and paste in Vi/Vim
Date: 2007-04-17 11:11
Author: srini
Category: software
Tags: linux, unix, vi, vim
Slug: copy-and-paste-in-vivim

This is a neat trick to know and saves a lot of time:

1.  Go to the beginning of the line where you want to start copying.
2.  Make sure you are in the command mode. (Hit ESC).
3.  Type "ma". Which means, you are marking the spot with "a".
4.  Go to the line till where you want to copy.
5.  type y`a (yank to mark a). The ` is the back tick.
6.  Now go to the place where you want to paste the text.
7.  type p

