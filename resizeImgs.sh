#!/bin/bash
# Date:<2016/05/10 14:30:09>
# author : phil estival <infos@caern.net>
# This script is distributed under the terms of the GPL v2 license.

# convert and resize all given files to png
# animated gifs produce one image per frame

if [ $# -lt 2 ]
then
   echo "Usage: `basename $0` size <file(s)> \n where size is WxH (256x128 for instance)"
   exit
fi

size=$1
for file in ${@:2}
do
	base=`basename $file .jpg`
	echo $file'->'$base$size.jpg
	convert $file -size $size -resize $size -monitor $base$size.png
done

