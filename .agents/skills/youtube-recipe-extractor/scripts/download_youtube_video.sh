#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <youtube-url> <output-directory>" >&2
  exit 64
fi

url="$1"
output_dir="$2"
output="$output_dir/video.%(ext)s"
args=(--no-playlist -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]' --merge-output-format mp4 -o "$output" "$url")

yt-dlp "${args[@]}" ||
  yt-dlp --cookies-from-browser chrome --no-continue "${args[@]}" ||
  yt-dlp --cookies-from-browser brave --no-continue "${args[@]}"
