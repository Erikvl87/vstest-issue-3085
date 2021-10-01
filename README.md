# TestHost crashes when using `System.Drawing`

This repository contains a reproduce case for the problem described at https://github.com/microsoft/vstest/issues/3085 regarding random crashes when using `System.Drawing` in a Docker container.

# Expected

Tests always succeed.

# Observed

- Tests randomly succeed or fail.
- It only happens when two tests in different test classes are using a `Graphics` object.
- The test to blame (`dotnet test --blame`) is random.

# How to reproduce.

1. `docker build -t my-tests .`
2. `docker run -it my-tests`
3. Wait till it crashes. It often occures within 10 runs.