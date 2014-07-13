#!/bin/bash
find $1 -type d -name ".git" -exec sh -c '(cd {} && cd .. && git fetch)' ';'
