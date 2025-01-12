#!/bin/bash

# finds highly complex (cyclomatic complexity) functions

# find the dir we exist within...
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# and cd into root project dir
cd ${DIR}/../..
go install github.com/fzipp/gocyclo/cmd/gocyclo@latest
gocyclo -over 15 $(find . -name '*.go' | grep -v vendor | grep -v _gen.go)
