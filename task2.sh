#!/bin/bash
#considering git local repo is configured with ssh-key
logfile="/tmp/out"
dat=`date +"%Y-%m-%d  %H:%m:%S"`
git_path="maventest"
cd maventest
git fetch origin
reslog=$(git log HEAD..origin/master --oneline)	
mast=`git branch -a|grep "*"|awk '{print $NF}'`

if [[ "${reslog}" != "" ]] ;then


out=`git log HEAD..origin/master --oneline `
echo "$dat Change detected in remote repo- $out" >> $logfile
git pull

	if [ $? -ne 0 ];then 

		################if changes is done on local repo then we need to have another condition for merge the change
		############################# git merge origin/master # completing the pull
		
              			echo "Subject: Git pull problem, local change detected" >  /tmp/alert.msg
                                   echo "Hi Team," >>  /tmp/alert.msg
                                   echo ""  >>  /tmp/alert.msg
                                   echo "" >>  /tmp/alert.msg
                                   echo "" >>  /tmp/alert.msg
                                   echo "`git log HEAD..origin/master --oneline `" >> /tmp/alert.msg
                                   echo "" >>  /tmp/alert.msg
                                   echo "" >>  /tmp/alert.msg
                                   echo "Pull is not possible local uncommited change detected" >> /tmp/alert.msg
                                   echo "" >>  /tmp/alert.msg
                                   echo "" >>  /tmp/alert.msg
                                   echo "" >> /tmp/alert.msg
                                   echo "" >> /tmp/alert.msg
                                   echo "" >> /tmp/alert.msg
                                   echo "Regards," >> /tmp/alert.msg
                                   echo "git admin" >> /tmp/alert.msg
                                   echo "" >> /tmp/alert.msg
                                  /usr/sbin/sendmail  devsop@xxxx.com  < /tmp/alert.msg

		
fi


fi
