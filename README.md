Task 1
Please write a program based on the requirement below.
Firstly, the script must take 6 consecutive numbers from command line arguments (each number is one argument).  
Secondly, the script must present to the user through standard output the following simple choice menu and operate accordingly in the background with the numbers the user entered previously:


    Perform subtraction and show output on screen comma separated.
    Perform multiplication and store result in a JSON file (i.e. {"InputNumber1": x, "InputNumber2": y, "InputNumber3": a, "InputNumber4": b, "InputNumber5": c, "InputNumber6": d, "Multiplication": X }, where x, y, a, b, c and d are user line arguments and X is the multiplication result)
    Pick randomly a number and show it on screen.
    Print sorted (highest to lowest) array/list numbers.
    Print sorted (lowest to highest) array/list numbers
Keep in mind that the script must respond appropriately upon possible human-errors. Also, the above choice menu must run forever on a loop until the user kills the program through SIGNIT or CTRL+C

 
############################################################################

For array or list management, i would have choosen to run with complete python  code for better variable handling but need sometime for menu based job.
 
 
############################################################################
 

Task 2 cron job that checks for a git repo whereby a build job is actioned once a change has been detected. Output the diff of the change and then start monitoring again.
############################################################################

This requirement not explains any specific use case, but i presumed that remote repo changes to monitored and pull the changes to keep the local repo with remote repo.
However when local repo have conflict with remote repo then additional measures to be taken like merge. so placed the email trigger when git pull fails to do.....




 
############################################################################


Task 3

Please find below the coding information.

A file named "file_diff.txt" contains the content of the command 	'git diff --name-status' , in general the name of the files that have changed in a commit or pull request (add/modify/delete/rename).

The content of the file file_diff.txt is as follows:

 

M     src/objects/Event.object

A     src/objects/Trading_Event__c.object

R     src/objects/ActiveScratchOrg.object

M     src/profiles/Admin.profile

D     src/reports/CACI_Imports/All_Closed.report

 

The first column denotes the status of their respective files in second column.

The files (e.g. Event.object) in column second literally exists in current directory path i.e. "src/objects" etc.

Question:

Write a program or code snippet (any language you prefer) which should read the above "file_diff.txt" line by line and do following:

- Capture the file name (e.g. Event.object) having status either modified or added (M/A) and write to a file added.txt.

- Capture the file name (e.g. All_Closed.report) having status either rename or deleted (R/D) and write to a file removed.txt.

- Please note the file names should not include paths.

- Once file names are captured they should be copied/moved from existing paths to the path "deployPackage/added" or "deployPackage/removed" as per their respective status (deployPackage is the parent folder of removed and added folders)

- For example: File names with status M/A and R/D should be copied/moved to "added" and "removed" folder respectively.

 

This is a real world example, of something we actually have in one of our build pipelines.


##################################################################################

used while with IFS for easy reading lines and copied the file using full path but captured the details with just file name to added.txt , deleted.txt

Added .gitignore file and included the added.txt , deleted.txt to skip the remote commit. 


####################################################################################

 
