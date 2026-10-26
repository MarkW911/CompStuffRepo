#!/bin/bash

UID_MIN=$(awk '$1 == "UID_MIN" {print $2; exit}' /etc/login.defs)
UID_MAX=$(awk '$1 == "UID_MAX" {print $2; exit}' /etc/login.defs)

while IFS=: read -r username password uid gid info home shell; do
    if [[ "$uid" =~ ^[0-9]+$ ]] &&
       [[ "$uid" -ge "$UID_MIN" && "$uid" -le "$UID_MAX" ]] &&
       [[ "$shell" != */nologin && "$shell" != */false ]]; then
        echo "$username"
    fi
done < /etc/passwd
