#!/usr/bin/env bash

echo "Running pre-push hook"
./scripts/run-brakeman.bash
./scripts/organize-gemfile.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Brakeman and Orgnaize must pass before pushing!"
 exit 1
fi