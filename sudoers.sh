#!/usr/bin/env bash

echo "Users with sudo group membership:"

sudo_users=$(getent group sudo | cut -d: -f4 | tr ',' '\n')

if [ -n "$sudo_users" ]; then
    while IFS= read -r user; do
        [ -n "$user" ] && echo "$user"
    done <<< "$sudo_users"
else
    echo "No users found in the sudo group."
fi
