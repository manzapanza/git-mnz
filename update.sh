#!/bin/sh

# Update Custom Plugin git-mnz ...
echo "Update Custom Plugin git-mnz ..."
echo ""

git fetch --all && git reset origin/master --hard

./install.sh