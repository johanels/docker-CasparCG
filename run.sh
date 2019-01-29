#!/bin/sh

cd "/opt/CasparCG Server/"

RET=5
while [ $RET -eq 5 ]
do
  LD_LIBRARY_PATH=lib xvfb-run -s "-screen 0 1024x768x16" bin/casparcg "$@"
  RET=$?
done
