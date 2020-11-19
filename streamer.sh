#!/usr/bin/env bash

# Read each word in the UNIX spellcheck dictionary
# and stream them out with a randomized delay to
# simulate a real stream.
#
# NOTE: requires netcat (nc) and GNU sleep. The
# sleep on Mac/BSD does not support fractional sleeps.

for i in $(cat /usr/share/dict/words); do
    echo $i
    zzz=$(( $RANDOM % 3 ))
    sleep 0.${zzz}
done | nc -lk 8888

