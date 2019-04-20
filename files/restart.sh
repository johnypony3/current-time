#!/bin/bash
set -e;

killall minidlnad || true
#echo 'server is stopped'
#chown -R $USER /Users/edward/.config/minidlna/cache
#rm -rf /Users/edward/.config/minidlna/cache

minidlnad -rR -f /Users/edward/.config/minidlna/minidlna.conf -P /Users/edward/.config/minidlna/minidlna.pid
echo 'server started'
