#!/usr/bin/env bash

# This script produces a data stream to be consumed by spark.
# Make sure you have netcat ('nc') installed!

port="${1}"
data="${2}" # try: dictionary words here: /usr/share/dict/words

if [[ -z "${port}" || -z "${data}" ]]; then
    echo "Usage: ${0} <port> <dataset>"
    exit 1
fi

while read i; do
    if [[ "${i}" == "" ]]; then
        continue
    fi
    echo "${i}"
    zzz=$(( $RANDOM % 3 ))
    sleep 0.${zzz}
done < "${data}" | nc -k --listen ${port}

