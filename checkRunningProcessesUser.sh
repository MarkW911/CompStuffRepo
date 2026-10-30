#!/usr/bin/env bash
username=$1

if pgrep -u "$username" > /dev/null; then
    echo "$username owns running processes:"
    ps -u "$username" -o pid,ppid,user,stat,cmd
else
    echo "$username has no running processes."
fi
