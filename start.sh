#!/bin/sh

# repeat tests until it crashes.
while true; do
    dotnet test --blame-crash --blame-crash-dump-type full --diag diag.log --configuration Release --no-build --no-restore -l "console;verbosity=detailed" --logger "trx;LogFileName=results.trx" MyTests
    if [ $? -ne 0 ]; then
        break
    fi
done