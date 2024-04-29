#!/bin/bash

# Setup nasm
sudo apt-get install -y -qq nasm gcc

# Building binary
make release -C ./src/
