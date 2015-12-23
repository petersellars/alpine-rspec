#!/bin/bash
set -e

env | sort

if [ "${1}" = "rake" ]
then
    exec bundle exec "$@"
else
    exec "$@"
fi
