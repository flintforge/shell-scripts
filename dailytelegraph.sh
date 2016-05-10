#!/bin/bash
# Date:<2016/05/10 14:18:53>
# author : phil estival <infos@caern.net>
# This script is distributed under the terms of the GPL v2 license.

# take the first file in the directory or choose a specific file
# mail it to the mailing list then move it to the sent directory

nail=~/opt/nail
space=~/tosend
DIR="$space/pics"
SENT="$space/pics/sent"
ML="$space/ML.ml"

subject=$1
text=$2
file=$3
[[ $text ]] || text="³²¹"
[[ $file ]] || file=$DIR/`ls $DIR | sed -n '1p'`
[[ $subject ]] || subject="image of the day"

if [ -a "$file" ]  && [ ! -d "$file"  ] 
then
	echo "`date` sending.. "$file"" \
	>> /tmp/mylog
	( echo "$text" )\
	| $nail -A myisp -s $subject -a "$file" \
	`cat $ML`
	mv $file $SENT
else 
	echo "$0 : not for $file" \
	>> ~/mylog
fi


