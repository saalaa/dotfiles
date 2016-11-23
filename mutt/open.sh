#!/bin/sh

cp $1 /tmp/mutt-attachment.$2

if uname -a | grep -qi darwin; then
  open /tmp/mutt-attachment.$2
fi
