#!/bin/bash
# Update do a find and replace of something in all files.  This is generally
# used to update toolchain version numbers.

DIR=$(dirname $0)

usage() {
  echo "$1, to find OLD pattern and replace with NEW pattern."
  echo "If only OLD is specified, it will be used to grep only."
  echo "usage: $0 OLD NEW"
}

old=$1 ; shift
new=$1 ; shift

if [ -z $old ] ; then
  usage "Missing parameters"
  exit 1
fi

if [ -z $new ] ; then
  git -C $DIR grep "$old"
else
  git -C $DIR grep -l "$old" | xargs sed -i -e "s/$old/$new/g"
fi
