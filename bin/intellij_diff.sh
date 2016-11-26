#!/bin/sh

# http://stackoverflow.com/a/13981716/7213548
# file1=$1
# if [ "$file1" == '/dev/null' ] || [ "$file1" == '\\.\nul' ] || [ ! -e "$file1" ]
#     then 
#        file1="/tmp/gitnull"
#        `echo "">$file1`
# fi
# file2=$2
# if [ "$file2" == '/dev/null' ] || [ "$file2" == '\\.\nul' ] || [ ! -e "$file2" ]
#     then 
#        file2="/tmp/gitnull"
#        `echo "">$file2`
# fi

FILE1=`cygpath -wla "$1"`
FILE2=`cygpath -wla "$2"`
idea.bat diff $FILE1 $FILE2