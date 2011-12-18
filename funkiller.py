# FUNKILLER
# Disables popular time wasting websites to encourage productivity.

# VARIABLES
# Path to hosts file.
HostsFile = "/etc/hosts"

# FUNCTIONS
# Enable FunKiller.
def enableFunkiller():
  print "Enabling FunKiller .."
  # write to hosts file
  print "FunKiller enabled. Do some work!"
  return

# Disable FunKiller.
def disableFunkiller():
  print "Disabling FunKiller .."
  # erase lines from hosts file
  print "FunKiller disabled."
  return

# Start of program.
# Open data file and print contents.
openfile = open('data.txt', 'r')
openfile.seek(-331,2)
print openfile.read()

