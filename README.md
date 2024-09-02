# Shepard-Bash-Init
The GNU Shepard Init System Written in Bash


Only known bug in init:  can't name a daemon 'ps', this is becuase of the tail bash call. If we changed it to head, then someone could bork everything by naming a daemon 'init'


Known bug in halt.sh:  this script would actually cause a kernel panic, probably shouldn't be run to poweroff the machine.
