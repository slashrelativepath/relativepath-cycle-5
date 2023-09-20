#!/bin/bash

# delete and purge relativepath VM
if ( ! multipass list | grep relativepath )
then
  echo "no relativepath VM found"
else 
  multipass delete --purge relativepath
  echo "relativepath VM has been deleted and purged"
fi
