#!/bin/bash
# The input is the JSON response of `/v/lesson/get_lesson_replay_timeline/?lesson_id=<lesson_id>`
set -e
i=0
for url in $(jq -r '.data.live_timeline[].replay_url' "$@"); do
  i=$((i + 1))
  mkdir $i && cd $i
  curl -s $url | sed '/^#/d' | tee >(sed 's/\(.*\)?.*/file \1/' > ffconcat.txt) | sed "s@^@$(dirname $url)/@" | aria2c -i - -x16 -s16 -k1M --summary-interval=0
  ffmpeg -f concat -i ffconcat.txt -c copy ../$i.ts
  cd ..
  rm -r $i
done
