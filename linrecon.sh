#!/bin/bash

####################################
#        Linux Recon Tool 	   #
#  Made by João Paulo de A. Filho  #
####################################

# @@ Functions Area

# @@ Main

if [ "$1" != "" ]; then
	echo "Something went wrong.."
	echo "Use: ./lirecon.sh"
fi

echo ""
echo "########## Starting #########" 
echo "Who am i?"
whoami
echo ""
echo "######### OS Specific Information ########"
echo "------  Banner  ------"
cat /etc/issue
echo "------  Releases  ------"
cat /etc/*release
echo "------  Echo version  ------"
cat /proc/version
echo "------  Vmlinuz File  ------"
ls /boot | grep "vmlinuz"
echo "------  Kernel Info  ------"
uname -a
echo""
echo "######### User Information #########"
echo "------  ID  ------"
id
echo "------  Whoami  ------"
whoami
echo "------  Finding Files with SUID or SGID  ------" 
find / \( -perm -2000 -o -perm -4000 \) -exec ls -ld {} \; 2>/dev/null
echo ""
echo "########## Cron Jobs ##########"
echo "------  /etc/cron.d jobs  ------"
cat /etc/cron.d/* 2> /dev/null 
echo "------  /var/spool/cron jobs  ------"
cat /var/spool/cron/* 2> /dev/null
echo "------ Listing /etc/crontab  ------"
cat /etc/crontab 2> /dev/null 
echo""
echo "########## Binaries ##########"
echo "------  Listing Interesting Binaries  ------"
 which awk perl python ruby gcc cc vi vim nmap find netcat nc wget tftp ftp 2>/dev/null
