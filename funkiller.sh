#!/bin/bash

# FUNKILLER
# Disables popular time wasting websites to encourage productivity.

# Path to hosts file.
$HostsFile = /etc/hosts

# Start of functions.
enableFun {
  echo "Enabling FunKiller .."
  # cat sites to hosts file
  echo "FunKiller enabled. Do some work!"
}

disableFun {
  echo "Disabling FunKiller .."
  # remove lines from hosts file
  echo "FunKiller disabled."
}

