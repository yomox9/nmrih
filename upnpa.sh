#!/bin/sh -x

#upnpc -l

ipadd=`ip route | grep src | cut -d " " -f 12`
echo ipadd=$ipadd
upnpc -a $ipadd 27015 27015 tcp
