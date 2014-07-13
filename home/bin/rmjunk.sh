#!/bin/bash
find . -name $1 -ls -exec rm -rf {} \;
