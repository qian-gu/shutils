#!/usr/bin/env bash

# check cmdline options
usage()
{
  echo "usage: rename.sh -s suffix -p pattern -r replacement"
  echo
  echo "       -s sufix          file suffix to match and rename, e.g., md"
  echo "       -p pattern        pattern to be replaced"
  echo "       -r replacement    replacement string"
  echo "       -h                show this message"

}
while getopts ":s:p:r:h" opt
do
  case $opt in
    s)
      echo "suffix = $OPTARG";
      suffix=$OPTARG
      ;;
    p)
      echo "pattern = $OPTARG";
      pattern=$OPTARG
      ;;
    r):
      echo "replacement = $OPTARG";
      replacement=$OPTARG
      ;;
    h):
      usage
      exit 1
      ;;
    ?)
      echo "Unknow option"
      usage
      exit 1
      ;;
  esac
done

# ensure all 3 option is passed
if [ ! $OPTIND -eq 7 ]
then
  echo "Error: Need all 3 options";
  echo "Exit!"
  usage
  exit 1;
fi

# print working directory
cwd=`pwd`
echo cwd = $cwd
echo

# find all matched files
filelist=`find . -name "*.$suffix"`

# reanme
for file in ${filelist[@]}
do
  path=`dirname $file`
  oldname=`basename $file`
  newname=`echo $oldname | sed 's/'"$pattern"'/'"$replacement"'/g'`
  # echo $path
  # echo $newname
  if [ $newname = $oldname ]
  then
    echo "skip $oldname"
    echo
  else
    newfile=$path"/"$newname
    echo "rename  $file  ==>  $newfile"
    mv $file $newfile
    echo
  fi
done
echo "Rename all done"