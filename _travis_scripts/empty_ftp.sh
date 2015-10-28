#! /usr/bin/env bash

lftp -u $FTP_USER,$FTP_PASSWORD ftp.strato.de <<EOF
glob -a rm -r *
quit
EOF
