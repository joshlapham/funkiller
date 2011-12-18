#!/bin/bash

# FUNKILLER
# Disables popular time wasting websites to encourage productivity.

# VARIABLES
# Directory where script resides.
BASEDIR=$(dirname $0)
# Path to hosts file.
hostsFile=$hostsFile
export hostsFile="/etc/hosts"
# Path to sites file.
sitesFile=$sitesFile
export sitesFile="$BASEDIR/sites.txt"
# Path to tmp file.
tmpFile=$tmpFile
export tmpFile="$BASEDIR/sites.tmp"
# Menu choice.
readChoice=$readChoice

# FUNCTIONS
# Enable FunKiller.
enableFun ()
{
  echo "Enabling FunKiller .."
  sed -i '' "/FUNKILLER/,/FUNKILLER/d" $hostsFile
  cat $sitesFile >> $hostsFile
  echo "FunKiller enabled. Do some work!"
}

# Disable FunKiller.
disableFun ()
{
  echo "Disabling FunKiller .."
  sed -i '' "/FUNKILLER/,/FUNKILLER/d" $hostsFile
  sed -e "s/127.0.0.1/#127.0.0.1/g" $sitesFile >> $tmpFile
  cat $tmpFile >> $hostsFile
  rm -f $tmpFile
  echo "FunKiller disabled."
}

# START OF MAIN
# Print choice.
echo "FUNKILLER"
echo -n "Enable or disable?: "
read -n 1 readChoice
echo ""

# Accept E/D answers only.
while [ "$readChoice" != e -a "$readChoice" != E -a "$readChoice" != d -a "$readChoice" != D ]; do
    echo -n "Choose E or D: "
    read -n 1 readChoice
    echo ""
    done

case $readChoice in
	        e|E)    
					enableFun
	        		;;

	        d|D)
	        disableFun
	            ;;
	  esac

