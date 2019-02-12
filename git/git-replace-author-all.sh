#!/bin/bash

echo 'Type the name to be replaced'
read OLD_NAME
echo 'Type the new name'
read NEW_NAME
echo 'Type the new email'
read NEW_EMAIL

git filter-branch -f --env-filter "
if [ \"\$GIT_AUTHOR_NAME\" = '$OLD_NAME' ]; then
    GIT_AUTHOR_NAME='$NEW_NAME'
    GIT_AUTHOR_EMAIL=$NEW_EMAIL
    GIT_COMMITTER_NAME='$NEW_NAME'
    GIT_COMMITTER_EMAIL=$NEW_EMAIL
fi
" -- --all

