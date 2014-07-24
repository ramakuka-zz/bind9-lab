#!/bin/bash
COOKBOOKDIR=cookbooks/
ROLEDIR=roles/
for i in `ls -1 $COOKBOOKDIR`; do
  knife cookbook upload $i -o $COOKBOOKDIR
done

for i in `ls -1 $ROLEDIR`; do
  knife role from file roles/$i 
done
