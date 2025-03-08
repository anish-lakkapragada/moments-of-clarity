#!/bin/bash

GITHUB_TOKEN="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"

cd ~/Documents/git-repos/anish-lakkapragada.github.io

# fall 2024 term 
/usr/bin/rsync -av --delete ~/Documents/classes/old-classes/math-226/psets notes/math-226 > /dev/null 2>&1
/usr/bin/rsync -av --delete ~/Documents/classes/old-classes/math-226/sols notes/math-226 > /dev/null 2>&1

/bin/sh rename-files.sh notes/math-226/psets
/bin/sh rename-files.sh notes/math-226/sols

/usr/bin/rsync -av --delete ~/Documents/classes/old-classes/stats-241/psets notes/stats-241 > /dev/null 2>&1
/usr/bin/rsync -av --delete ~/Documents/classes/old-classes/stats-241/sols notes/stats-241 > /dev/null 2>&1

/bin/sh rename-files.sh notes/stats-241/psets
/bin/sh rename-files.sh notes/stats-241/sols

# spring 2025 term 
/usr/bin/rsync -av --delete ~/Documents/math-255/psets notes/math-255 > /dev/null 2>&1
/usr/bin/rsync -av --delete ~/Documents/math-255/sols notes/math-255 > /dev/null 2>&1

/bin/sh rename-files.sh notes/math-255/psets
/bin/sh rename-files.sh notes/math-255/sols

/usr/bin/rsync -av --delete ~/Documents/math-244/psets notes/math-244 > /dev/null 2>&1
/usr/bin/rsync -av --delete ~/Documents/math-244/sols notes/math-244 > /dev/null 2>&1

/bin/sh rename-files.sh notes/math-244/psets
/bin/sh rename-files.sh notes/math-244/sols

/usr/bin/rsync -av --delete ~/Documents/stats-242/psets notes/stats-242 > /dev/null 2>&1
/usr/bin/rsync -av --delete ~/Documents/stats-242/sols notes/stats-242 > /dev/null 2>&1

/bin/sh rename-files.sh notes/stats-242/psets
/bin/sh rename-files.sh notes/stats-242/sols

/bin/sh build.sh

/usr/bin/git add . 
/usr/bin/git commit -m "nightly build" 
/usr/bin/git push https://$GITHUB_TOKEN@github.com/anish-lakkapragada/anish-lakkapragada.github.io.git

# ~/Library/LaunchAgents/com.anish.cronjob.plist
