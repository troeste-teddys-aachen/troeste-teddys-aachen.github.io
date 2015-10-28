#! /usr/bin/env bash

lftp -u $1,$2 <<EOF
glob -a rm -r *
quit
EOF
