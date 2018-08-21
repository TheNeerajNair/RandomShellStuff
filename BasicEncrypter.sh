#!/bin/bash
#Basic Encrypter Utility Program



####################################################
################PROCESSOR###########################
function encrypter()
{
echo "Encryption Sequence Started"
echo "Now Enter the Exact File Name with extensions"
read file
echo "Running File Status Checker"
file_list=( $(ls) ) 
for i in ${file_list[@]}
do
if [ "$i" == "$file" ]
then
echo "File Status : PRESENT"
gpg -c $file
echo "I have encrypted the file successfully..."
echo "Running Deletion Sub-Utility"
echo "Do You want to remove the original file now? Hit y for Yes, n for No"
read choice
if [ "$choice" == 'y' ]
then
echo "Running Deletion Sequence"
rm -rf $file
else
echo "$file NOT deleted!"
fi
else
echo "File Status Check : File not Present"
echo "Encryption Sequence Stopped; Program will now abort"
fi
done
}
#######################################################
#######################################################


echo "Welcome, This is the Basic Encrypter Utility"
echo "Is the Target File Located in the same directory as me?"
echo "Hit y for Yes, n for No"
read first_choice
if [ "$first_choice" == 'y' ]
then
        path=`pwd`
        cd $path
		encrypter
        echo "Curent Directory Reintitalised to $path "
else
        echo "Manully Enter Path or Location Like /home/nj/Demo "
        read directory
        cd $directory
		encrypter		
		
fi
