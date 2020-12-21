#!/bin/bash

#git diff --name-status > file_diff.txt
#repo="maventest"
#cd $repo

parentfolder="deployPackage"

check()
{

if [ ! -d $parentfolder/$1 ];then
cd  $repo
mkdir -p $parentfolder/$1
fi

}

while IFS=" " read change file
do
change=`echo $change|sed 's/[[:blank:]]//g'|sed 's/[[:space:]]//g'`
file_nf=`echo $file|awk -F '/' '{print $NF}'`
if [ "${change}" == "M" ] ||  [ "${change}" == "A" ];then
	echo "File needs to be copied to deployPackage/added"
	action="addeded"
	check added
	if [ ! -e added.txt ];then
	echo "$file_nf  Modified or added  $change " >> added.txt
        echo "added.txt" >> .gitignore
	rsync -avz $file deployPackage/added 
	fi
elif [ "${change}" == "R" ] ||  [ "${change}" == "D" ];then
	echo "Delete action detected  deployPackage/deleted"
        action="deleted"
        check deleted
        if [ ! -e deleted.txt ];then
        echo "$file_nf  deleteted/renamed  $change " >> deleted.txt
	echo "deleted.txt" >> .gitignore
	rsync -avz $file deployPackage/deleted

        fi

fi

done < file_diff.txt
