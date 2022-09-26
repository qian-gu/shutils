#!/usr/bin/env bash

# check cmdline options
usage()
{
  echo "usage: substitute.sh -k keyword -p pattern -r replacement"
  echo
  echo "       -k keyword        keyword to filt out matched files"
  echo "       -p pattern        pattern to be replaced"
  echo "       -r replacement    replacement string"
  echo "       -h                show this message"

}
while getopts ":k:p:r:h" opt
do
  case $opt in
    k)
      echo "keyword = $OPTARG";
      keyword=$OPTARG
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

# find and filter
echo
echo "Matching list:"
match_options=-nriH
grep --color --exclude-dir=".git" $match_options $keyword $cwd

# substitute
echo
echo "Substitute all ..."
sed -i 's|'"$pattern"'|'"$replacement"'|g' `grep -lri --exclude-dir=".git" $keyword $cwd`
echo "Substitute done"