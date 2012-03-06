## funkiller

A bash script that disables popular time wasting websites via /etc/hosts

By Josh Lapham [josh@joshlapham.com]

License: Beerware

## Usage

Time wasting sites are contained in `sites.txt`

Edit `sites.txt` to your liking, then run `funkiller.sh`, which will append the contents of `sites.txt` to `/etc/hosts`.

If you choose to disable funkiller, it will comment out the sites in `/etc/hosts`.

NOTE: There are better ways to do this, but it does the job for me.
