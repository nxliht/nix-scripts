#!/bin/bash

if [ $# == 2 ]; then
    NEW_NAME=$1
    NEW_EMAIL=$2
elif [[ $# == 1 || $# -gt 2 ]]; then
    echo "Usage $0 <new_name> <new_email>"
    exit 1
else
    echo 'Type the new name'
    read NEW_NAME
    echo 'Type the new email'
    read NEW_EMAIL  
fi

git filter-branch -f --env-filter "
    GIT_AUTHOR_NAME='$NEW_NAME'
    GIT_AUTHOR_EMAIL=$NEW_EMAIL
    GIT_COMMITTER_NAME='$NEW_NAME'
    GIT_COMMITTER_EMAIL=$NEW_EMAIL
" -- --all

