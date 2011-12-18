#!/bin/bash

# FUNKILLER
# Disables popular time wasting websites to encourage productivity.

# VARIABLES
# Path to hosts file.
hostsFile=$hostsFile
export hostsFile="/etc/hosts"
# Path to sites file.
sitesFile=$sitesFile
export sitesFile="data.txt"
# Path to tmp file.
tmpFile=$tmpFile
export tmpFile="data.tmp"
# Menu choice.
readChoice=$readChoice

# FUNCTIONS
# Enable FunKiller.
enableFun ()
{
  echo "Enabling FunKiller .."
  # delete funkiller anyway, just in case
  sudo sed -i '' "/FUNKILLER/,/FUNKILLER/d" test.txt
  sudo cat $sitesFile >> $hostsFile
  echo "FunKiller enabled. Do some work!"
}

# Disable FunKiller.
disableFun ()
{
  echo "Disabling FunKiller .."
  # remove lines from hosts file
  sudo sed -i '' "/FUNKILLER/,/FUNKILLER/d" $hostsFile
  sed -e "s/127.0.0.1/#127.0.0.1/g" $sitesFile >> $tmpFile
  #sudo cat $tmpFile >> $hostsFile
  rm -f $tmpFile
  echo "FunKiller disabled."
}

# START OF PROGRAM
# Print choice.
echo "FUNKILLER"
echo -n "Enable or disable?: "
read -n 1 readChoice
echo ""

# Accept Y/N answers only.
while [ "$readChoice" != y -a "$readChoice" != Y -a "$readChoice" != n -a "$readChoice" != N ]; do
    /bin/echo -n "Choose Y or N: "
    read -n 1 readChoice
    /bin/echo ""
    done

case $readChoice in
	        y|Y)    
					enableFun
	        		;;

	        n|N)
	        disableFun
	            ;;
	  esac

