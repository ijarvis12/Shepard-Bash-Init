# Shepard-Bash-Init
The GNU Shepard Init System Written in Bash


Only known bug in init:  can't name a daemon 'init', but this goes against convention for the daemons as it should be in this case a bash script called 'init.sh', which is okay.


Known bug in halt.sh:  this script would actually cause a kernel panic, probably shouldn't be run to poweroff the machine.
