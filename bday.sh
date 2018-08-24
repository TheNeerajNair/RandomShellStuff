#!/bin/bash
#we are importing the code from the ip_address_mail.sh script in this program 
# -using source keyword
#define from and to address : from can be also username@hostname of the computer 
TO="to@address.com"
FROM="from@address.com"
#Define some format on text file
echo "filesystem having less 10% free space">text.txt
echo "">>text.txt
echo "filesystem    freespace">>text.txt
count=`df --output=size,avail | wc -l`
for (( i = 2; i <= $count; i++ ))
do
  used=`df --output=used | sed -n "$i"p`
  available=`df --output=avail | sed -n "$i"p`
  fileSys=`df --output=source --output=avail | sed -n "$i"p`
  final=$(($(($(($available*100))))/$(($available$used))))
#file system less than 10% redirecting to text.txt
  if [ $final -le 10 ]
  then
    echo "$fileSys">>text.txt
  fi
done
#contents of text is piped to mail command and defined the subject
cat "text.txt" | mail -s Subject:low_free_space ${FROM} ${TO}
cat text.txt

echo the mail is sent"
