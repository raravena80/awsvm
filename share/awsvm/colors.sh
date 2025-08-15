#!/usr/bin/env bash

# Check if stdout is a terminal
if [ -t 1 ]; then
  export AWSVM_COLOR_RESET="\033[0m"
  export AWSVM_COLOR_RED="\033[0;31m"
  export AWSVM_COLOR_GREEN="\033[0;32m"
  export AWSVM_COLOR_YELLOW="\033[0;33m"
  export AWSVM_COLOR_BLUE="\033[0;34m"
  export AWSVM_COLOR_BOLD="\033[1m"
else
  export AWSVM_COLOR_RESET=""
  export AWSVM_COLOR_RED=""
  export AWSVM_COLOR_GREEN=""
  export AWSVM_COLOR_YELLOW=""
  export AWSVM_COLOR_BLUE=""
  export AWSVM_COLOR_BOLD=""
fi
