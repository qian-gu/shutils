#!/usr/bin/env bash

# check cmdline options
usage()
{
  echo "usage: capitalize.sh -s suffix"
  echo
  echo "       -s sufix    file suffix to match and capitalize, e.g., md"
  echo "       -h          show this message"

}
while getopts ":s:h" opt
do
  case $opt in
    s)
      echo "suffix = $OPTARG";
      suffix=$OPTARG
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

# ensure all 1 option is passed
if [ ! $OPTIND -eq 3 ]
then
  echo "Error: Need pass filename suffix option";
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
  oldname=`basename $file .$suffix`
  newname=`echo $oldname | tr 'a-z' 'A-Z'`
  # echo $path
  # echo $newname
  newfile=$path"/"$newname.$suffix
  if [ $newname = $oldname ]
  then
    echo "$oldname".$suffix "is already capitalized."
    echo
  else
    echo "capitalize  $file  ==>  $newfile"
    mv $file $newfile
    echo
  fi
done
echo "Capitalize all done"