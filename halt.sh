#!/usr/bin/env bash

kill -s SIGPWR 1

PROCS=$(ps ax | awk '{print $1}')

for proc in "$PROCS"; do
  kill -s SIGSTOP $proc
done

PROCS=$(ps ax | awk '{print $1}')

for proc in "$PROCS"; do
  kill $proc
done

for dev in "$(ls -1 /media)"; do
  umount "/media/$dev"
done

for dev in "$(ls -1 /mnt)"; do
  umount "/mnt/$dev"
done

umount /boot

umount /
