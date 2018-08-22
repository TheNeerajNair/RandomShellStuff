#!/bin/bash
####################################################
####################################################
#Basic Encrypter Utility Program
####################################################

############### FUNCTIONS ##########################

function tar_maker()
{
echo "Tar Maker Sequence Now Started"
echo "Now name the exact file which you would like to tar or specify"
read filename
echo "Running File Status Checker"
file_list=( $(ls) )
for i in ${file_list[@]}
do
if [ "$i" == "$filename" ]
then
echo "File Status : PRESENT"
tar -cvf "$file".tar "$file"
echo "I have Tarrred the file successfully..."
echo "Running Deletion Sub-Utility"
echo "Do You want to remove the original file now? Hit y for Yes, n for No"
read choice
if [ "$choice" == 'y' ]
then
echo "Running Deletion Sequence"
rm -rf $filename
else
echo "$file NOT deleted!"
fi
else
echo "File Status Check : File not Present"
echo "Tar Marker Sequence Stopped; Program will now abort"
fi
done
}

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
PROGRAM STARTS FROM THIS POINT!!!
#######################################################
#######################################################


echo "Welcome, This is a Swiss Army Knife Program "
echo "So far this program has been designed to tar/encrypt files, more features coming soon!"
echo "Is the Target File Located in the same directory as me?"
echo "Hit y for Yes, n for No"
read first_choice
if [ "$first_choice" == 'y' ]
then
        path=`pwd`
        cd $path
        echo "Hit 1 for Encrypter Utility or Hit 2 for Tar maker"
        read sub_choice
        if [ "$sub_choice" == 1 ]
        then
			encrypter
        else
            tar_maker
		fi
        echo "Curent Directory Reintitalised to $path "
else
        echo "Manully Enter Path or Location Like /home/nj/Demo "
        read directory
        cd $directory
        echo "Hit 1 for Encrypter Utility or Hit 2 for Tar maker"
        read sub_choice
        if [ "$sub_choice" == 1 ]
        then
                encrypter
        else
                tar_maker
        fi                            
fi

