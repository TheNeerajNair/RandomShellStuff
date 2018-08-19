#!/bin/bash
#Basic Encrypter Utility Program


echo "Welcome, This is the Basic Encrypter Utility"
echo "Choose Location or Folder location where You want this to run"
echo "Is the Target File Located in the same directory as me?"
echo "Hit y for Yes, n for No"
read first_choice
if [ "$first_choice" == y ]
then
	pwd
	path=`pwd`
	cd $path
	echo "Curent Directory Reintitalised to $path "
else
	echo "Enter Location Like = /home/nj/Demo "
	read directory
	cd $directory && if [ $? == 0 ]
	then
		echo "Now Enter the Exact File Name with extension"
		read file;
		gpg -c $file
		echo "I have encrypted the file successfully..."
		echo "Do You want to remove the original file now? Hit y for Yes, n for No"
		read choice
		if [ "$choice" == 'y' ]
		then
		echo "Running Deletion Sequence"
		rm -rf $file
		else
		echo "File NOT deleted!"
		fi
else
	echo "Invalid Directory path! Aborting Program"
	exit