#!/bin/bash

# if a folder matches a given pattern, then return false (1).
# if it doesn't match, return true (0).
# This is to prevent a pattern-matched folder to be linked.
check_ok() {
  if [[ "$1" == "xsessions" ]]; then
    return 1
  fi
  if [[ "$1" == "breeze" ]]; then
    return 1
  fi
  return 0
}
