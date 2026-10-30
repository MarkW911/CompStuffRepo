#!/usr/bin/env bash

echo "===== SYSTEMD TIMERS ====="
systemctl list-timers --all

echo "===== TIMER UNIT FILES ====="
systemctl list-unit-files --type=timer

echo "===== CUSTOM TIMER FILES ====="
sudo find /etc/systemd/system /run/systemd/system \
-type f -name "*.timer" 2>/dev/null

echo "===== RECENT SYSTEMD TIMER ACTIVITY ====="
sudo journalctl -u '*.timer' --since "24 hours ago" --no-pager
