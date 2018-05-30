#!/bin/bash
# input git path
path="/Users/"
clear
cd $path
echo ""
echo $path
git add .
git commit -m 'auto commit'
echo ""
echo "wait 1 hour"
echo ""
C=40
A=0

while true
do
	for i in {1,2}
	do
		A=0
		while [ $A -le $C ]
		do
		  B=""
		  for i in `seq 1 $C`
		  do
		    if [ $A -eq $i ]
		    then
		      B="$B>"
		    else
		      if [ $i -le $A ]
		      then
		        B="$B-"
		      else
		        B="$B "
		      fi
		    fi
		  done
		  P=`expr $A \* 100 / $C`
		  echo -en " until commit...  [$B] $P %\r"
		  sleep 90
		  A=`expr $A + 1`
		done
		cd $path
		echo ""
		echo $path
		git add .
		git commit -m 'auto commit'
		echo ""
		echo "wait 1 hour"
		echo ""
		# commit per 1hour
	done
	A=0
	while [ $A -le $C ]
	do
	  B=""
	  for i in `seq 1 $C`
	  do
	    if [ $A -eq $i ]
	    then
	      B="$B>"
	    else
	      if [ $i -le $A ]
	      then
	        B="$B-"
	      else
	        B="$B "
	      fi
	    fi
	  done
	  P=`expr $A \* 100 / $C`
	  echo -en " until push...  [$B] $P %\r"
	  sleep 90
	  A=`expr $A + 1`
	done
	cd $path
	echo ""
	echo $path
	git add .
	git commit -m 'auto commit'
	echo ""
	echo "wait 1 hour"
	echo ""
	cd path
	git push origin master 
	# commit per 3hour
done
