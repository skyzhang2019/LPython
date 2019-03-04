#!/bin/bash
##usage: mac2user maplist userlist###
if [ -z "$1" -o -z "$2" ];then
	echo "please input file name of maplist and userlist..."
	echo "usage: mac2user maplist userlist"
else 
if [ -e "$1" -a -e "$2" ];then
	i=0
	m_mac=""
	m_user=""
	m_integrity=0
	for lines in `cat $1`
		do
			var1=${lines}
			if [ `expr length $var1` -eq 17 ];then
			#	echo "$var1 is mac"
				m_mac=$var1
				m_integrity=1
			else
			#	echo "$var1 is user"
				m_user=$var1
				m_integrity=`expr $m_integrity + 1`
			fi
		i=`expr $i + 1`
		###if i/2 then bengin to sed###
		if [ `expr $i % 2` -eq 0 -a $m_integrity -eq 2 ];then
			echo "I am running sed -i 's/'$m_mac'/'$m_user'/g' $2"
			sed -i 's/'$m_mac'/'$m_user'/g' $2	
		fi
		done
else
	if [ -e "$1" ];then
		echo "$2 is not existed,please check file name again"
	else 
		echo "$1 is not existed,please check file name again"
	fi
fi
fi
