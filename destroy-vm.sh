#!/bin/bash

# delete and purge relativepath VM
if ( multipass list | grep relativepath )
then
  multipass delete --purge relativepath
  echo "relativepath VM has been deleted and purged"
else
  echo "no relativepath VM found"
fi
