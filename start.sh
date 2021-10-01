#!/bin/sh

# exit when any command fails.
set -e

# repeat tests until it crashes.
while true
do
	dotnet test --blame --diag diag.log --configuration Release --no-build --no-restore -l "console;verbosity=detailed" --logger "trx;LogFileName=results.trx" MyTests
done
