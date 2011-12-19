# Open sites.txt file for reading
aFile = File.open('/etc/hosts', 'r')
# Print each line in file
aFile.each_line {|line| puts line }

