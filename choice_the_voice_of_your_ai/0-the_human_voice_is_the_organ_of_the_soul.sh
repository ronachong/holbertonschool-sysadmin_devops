#!/bin/bash

# $1 is string to be passed to say
# $2 is f/m/x for sex of voice
# $3 is the server for the script to upload the message to

case "$2" in
    f)
	voice=Agnes
	;;
    m)
	voice=Albert
	;;
    r)
	voice="Pipe Organ"
	;;
esac
    


# filename is first word in $1 string
filename=$(echo $1 | awk '{print $1}')

# commands to run
say -o $filename.m4a -v $voice $1
scp $filename.m4a admin@$3:/var/www/html/$filename.m4a
echo "Listen to this message at http://$3/$filename.m4a"
