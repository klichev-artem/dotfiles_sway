#!/usr/bin/env bash

playerctl --follow metadata \
  --format '{{artist}}|{{title}}|{{mpris:artUrl}}' |
while IFS='|' read -r artist title art; do

    [[ -z "$title" ]] && continue

    icon="audio-x-generic"

    # Firefox MPRIS отдаёт локальную обложку как file:///...
    if [[ "$art" == file://* ]]; then
        cover="${art#file://}"

        if [[ -f "$cover" ]]; then
            icon="$cover"
        fi
    fi

    notify-send \
        -a "Music" \
        -i "$icon" \
        -h string:x-canonical-private-synchronous:music \
        "NOW PLAYING" \
        "${artist:-Unknown Artist}
$title"
done
