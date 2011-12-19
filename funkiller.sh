#!/bin/bash

###
#
# FUNKILLER
# Disables popular time wasting websites to encourage productivity.
#
# By Josh Lapham [josh@joshlapham.com]
#
# DISCLAIMER: I don't take responsibility for any of this.
#
# Misc notes:
#
# * Must be run as sudo.
# * Appends to end of /etc/hosts file.
# * Enabling and disabling clears FunKiller section of hosts file with sed. Disabling comments out hosts added by FunKiller.
# * Edit sites you want to disable in sites.txt
#
###

# VARIABLES
# Directory where script is being run from.
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
# Uname value.
OS=`uname`

# FUNCTIONS
# Enable Funkiller
enableFun ()
{
  echo "Enabling Funkiller .."
  # Find FunKiller comment header & footer in hosts file and remove lines.
  # Check and run different commands if OS is Mac.
  if [[ "$OS" == "Darwin" ]]; then
    # TESTING
    echo $OS
    echo "Mac"
    sed -i '' "/FUNKILLER/,/FUNKILLER/d" $hostsFile
    # Append sites.txt file to end of hosts file.
    cat $sitesFile >> $hostsFile
    # Flush the DNS cache.
    dscacheutil -flushcache
    echo "Funkiller enabled. Do some work!"
  else
    # TESTING
    echo $OS
    echo "Linux"
    sed -i "/FUNKILLER/,/FUNKILLER/d" $hostsFile
    # Append sites.txt file to end of hosts file.
    cat $sitesFile >> $hostsFile
    echo "Funkiller enabled. Do some work!"
  fi
}

# Disable Funkiller
disableFun ()
{
  echo "Disabling Funkiller .."
  # Find FunKiller comment header & footer in hosts file and remove lines.
  # Check and run different commands if OS is Mac.
  if [[ "$OS" == "Darwin" ]]; then
    # TESTING
    echo $OS
    echo "Mac"
    sed -i '' "/FUNKILLER/,/FUNKILLER/d" $hostsFile
    # Comment out 127.0.0.1 lines in sites.txt file and write to a temp file.
    sed -e "s/127.0.0.1/#127.0.0.1/g" $sitesFile >> $tmpFile
    # Write commented out lines from temp file to hosts file.
    cat $tmpFile >> $hostsFile
    # Flush the DNS cache.
    dscacheutil -flushcache
    # Clean up and remove temp file.
    rm -f $tmpFile
    echo "Funkiller disabled."
  else
    # TESTING
    echo $OS
    echo "Linux"
    sed -i "/FUNKILLER/,/FUNKILLER/d" $hostsFile
    # Comment out 127.0.0.1 lines in sites.txt file and write to a temp file.
    sed -e "s/127.0.0.1/#127.0.0.1/g" $sitesFile >> $tmpFile
    # Write commented out lines from temp file to hosts file.
    cat $tmpFile >> $hostsFile
    # Clean up and remove temp file.
    rm -f $tmpFile
    echo "Funkiller disabled."
  fi
}

# START OF MAIN
# Print choice
echo "Funkiller"
echo -n "Enable or disable?: "
read -n 1 readChoice
echo ""

# Accept E/D answers only
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
	esac
