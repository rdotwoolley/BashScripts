#!/bin/sh

for key in `gpg --list-keys | grep uid | awk '{print $2}'`
do
     if [[ $key = *EXTERNAL* ]]
     then
         echo "Exporting External Secret for $key"
         gpg  --export-secret-key -a $key > RPM-GPG-KEY-$key.secret 
         echo "Exporting External Public for $key"
         gpg  --export-key -a $key > RPM-GPG-KEY-$key.public
     fi
     if [[ $key = *INTERNAL* ]]
     then
         echo "Exporting Internal Secret for $key"
         gpg  --export-secret-key -a $key > RPM-GPG-KEY-$key.secret
         echo "Exporting Internal Public for $key"
         gpg  --export-key -a $key > RPM-GPG-KEY-$key.public
     fi
done 

