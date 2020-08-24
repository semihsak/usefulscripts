# $1 Check Algorithm (for example md5sum)
# $2 Path
# $3 Expectable Result

#!/bin/bash
algo=$1
filename=$2
filehash=$3


error() {
  echo "ERROR: $1"
  exit 1
}

#Input Checks

if [ -z "$algo" ];
then
    error "You need provide hash algorithm for example md5sum,sha1sum,sha256sum"
fi

if [ -z "$filename" ];
then
    error "You need provide filepath"
fi

if [ -z "$filehash" ];
then
    error "You need provide expectable filehash value"
fi

if [ ! -f $filename ];
then
    error "File $filename does not exist"
fi

#Check Values {$var,, -> lowercase }

if [ `$algo $filename | cut -d ' ' -f1`  = ${filehash,,} ]
then
  echo "Hash matches"
else
  error "$filename do not match provided $algo"
fi
