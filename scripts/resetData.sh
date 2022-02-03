#!/bin/sh

echo "system.resetAllData()" | nc -w 3 127.0.0.1 21026 > /dev/null