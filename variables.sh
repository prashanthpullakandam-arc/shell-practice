#!/bin/bash
scriptlog=$(date +%s)
echo "log generated at $scriptlog"
sleep 10
endtime=$(date +%s)
TOTALTIME=($endtime-$scriptlog)
echo "log generated at end date $endtime"
echo "testp total time $TOTALTIME"

