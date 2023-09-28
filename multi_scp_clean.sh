#!/bin/bash

HOSTS="host1 host2 host3"
# You need one value for the password if the password is the same in all hosts.
PASSWORD='Passowrd_Host1'

for HOST in $HOSTS
do
    #Change root to the username you want. 
    expect -c "
    spawn /usr/bin/scp File_to_be_copied  root@$HOST:/file_path_on_target
    expect {
    "*password:*" { send $PASSWORD\r;interact }
    }
    exit
    "
printf "DONE: "
done
