#!/bin/sh
# try to run make before commit.
# add this to .git/hooks/pre-commit and chmod a+x
# cp -p git-pre-commit.sh .git/hooks/pre-commit

echo 'Run pre-commit make testing'
make preview
echo 'done pre-commit make testing'

